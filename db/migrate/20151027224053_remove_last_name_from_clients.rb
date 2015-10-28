class RemoveLastNameFromClients < ActiveRecord::Migration
  def change
  	remove_column :clients, :last_name, :string  	
  end
end
