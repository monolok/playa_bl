class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :national_id
      t.string :address
      t.integer :image_id

      t.timestamps null: false
    end
  end
end
