class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :filename
      t.string :mime_type
      t.string :data
      t.integer :client_id

      t.timestamps null: false
    end
  end
end
