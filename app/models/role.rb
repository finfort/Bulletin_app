class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
 attr_accessible :name
  has_many :users

  def self.admin
    Role.find_or_create_by_name "Admin"
  end

   def self.user
    Role.find_or_create_by_name "User"
  end

  def self.moderator
    Role.find_or_create_by_name "Moderator"
  end
end
