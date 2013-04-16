class Remover < ActiveRecord::Migration
  def up

    remove_column :users, :gmaps, :boolean #not mandatory, see wiki
  end

  def down
  end
end
