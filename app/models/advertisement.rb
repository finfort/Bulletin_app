class Advertisement < ActiveRecord::Base
  attr_accessible :content, :img

  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 760 }
  default_scope order: 'advertisements.created_at DESC'
  mount_uploader :img, ImgUploader
  has_many :comments, dependent: :destroy

  resourcify
end
