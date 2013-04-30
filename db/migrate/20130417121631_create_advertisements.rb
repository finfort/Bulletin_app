class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :content
      t.integer :user_id
      t.string :img
      t.timestamps
    end
  end
end
