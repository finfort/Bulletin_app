class User < ActiveRecord::Base
  has_many :authentications
  has_many :advertisements, dependent: :destroy
  has_many :comments#, as: :commentable
  belongs_to :role

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessor   :login
  attr_accessible :login
  attr_accessible :latitude, :longitude
  attr_accessible :role_ids
  attr_accessible :roles
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :role_id
  attr_accessible :full_name, :birthday, :address, :city, :state, :country, :zip
  attr_accessible :addressFull

  validates :username, uniqueness: true
  #validates :full_name, :birthday, :address, :city, :state, :country, :zip, :presence => true

  after_validation :geocode
  after_create :assign_user_role

  rolify
  geocoded_by :addressFull, :if => :address_changed?

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
      user.username = auth.info.nickname ||Faker::Name.name
      #raise auth.to_yaml
      user.email = auth.info.email || user.username + "@example.com"# if email.blank?
      user.zip = "000000"
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
  def birthday_required?
    !birthday.blank? && super
  end

  def email_required?
    !email.blank? && super
  end
  def city_required?
    !city.blank? && super
  end
  def country_required?
    !country.blank? && super
  end
  def zip_required?
    !zip.blank? && super
  end

  def full_name_required?
    !full_name.blank? && super
  end
  def address_required?
    (!address.blank?) && super
  end
 def state_required?
    (!state.blank?) && super
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
