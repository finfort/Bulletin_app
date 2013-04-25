class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :advertisement_id
      t.string :author_name
      t.string :site_url
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
