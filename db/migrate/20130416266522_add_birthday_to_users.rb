class AddBirthdayToUsers < ActiveRecord::Migration
change_table :users do |t|
  t.remove :birthday
  t.date :birthday, :default => Time.now

end
end
