class AddBirthdayToUsers < ActiveRecord::Migration
change_table :users do |t|
  t.remove :birthday
  t.string :birthday, :default => :null

end
end
