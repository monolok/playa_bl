class RemoveImageIdFromClients < ActiveRecord::Migration
  def change
  	remove_column :clients, :image_id, :integer  	
  end
end
