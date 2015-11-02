class ModifyNationalIdFromClients < ActiveRecord::Migration
  def change
  	remove_column :clients, :national_id, :integer 
  	add_column :clients, :national_id, :string 	
  end
end
