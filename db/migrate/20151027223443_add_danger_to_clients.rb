class AddDangerToClients < ActiveRecord::Migration
  def change
    add_column :clients, :danger, :string
  end
end
