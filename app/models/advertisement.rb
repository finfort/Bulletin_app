class Advertisement < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  attr_accessible :user_id, :content, :img, :user

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 760 }
  default_scope order: 'advertisements.created_at DESC'
  mount_uploader :img, ImgUploader

  resourcify

  include PgSearch
  pg_search_scope :search, against: [:content],
    using: {tsearch: {dictionary: "english"}},
    associated_against: {users: [:user_name, :address, :city, :full_name], comments: [:author_name, :content, :site_url]}

  def self.text_search(query)
    if query.present?
      where("content @@ :q", q: query)
    else
      scoped
    end
  end

end
