class User < ActiveRecord::Base
  rolify
  has_many :authentications
  has_many :advertisements, dependent: :destroy

  attr_accessible :role_ids
  belongs_to :role
  after_create :assign_user_role

  attr_accessible :roles
  has_many :comments#, as: :commentable
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :role_id
  attr_accessible :full_name, :birthday, :address, :city, :state, :country, :zip
  validates :full_name, :birthday, :address, :city, :state, :country, :zip, :presence => true
  #validates_uniqueness_of :username
  validates :username, uniqueness: true
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  attr_accessible :login
  attr_accessible :latitude, :longitude
  geocoded_by :addressFull, :if => :address_changed?
  after_validation :geocode
  attr_accessible :addressFull
  def addressFull
    [address, city, state, country].join(' ')
  end

  def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
  end

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
  private
  def assign_user_role
    self.add_role "user"
  end

end
