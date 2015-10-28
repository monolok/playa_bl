class RemoveFirstNameFromClients < ActiveRecord::Migration
  def change
  	remove_column :clients, :first_name, :string
  end
end
