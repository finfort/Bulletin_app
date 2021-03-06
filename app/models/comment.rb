class Comment < ActiveRecord::Base

  resourcify
  attr_accessible :advertisement_id, :author_name,:site_url,:content, :user
  attr_accessible :advertisement
  belongs_to :advertisement
  belongs_to :user
  validates_presence_of :author_name, :content
end
