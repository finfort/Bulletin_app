class Advertisement < ActiveRecord::Base
  attr_accessible :content, :img

  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 360 }

  default_scope order: 'advertisements.created_at DESC'

  mount_uploader :img, ImgUploader

  acts_as_commentable

  has_many :comments, as: :commentable
end
