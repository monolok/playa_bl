class AddHostalNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hostal_name, :string
  end
end
