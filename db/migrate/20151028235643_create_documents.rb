class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
		t.string :name
		t.string :filename
    	t.string :mime_type
    	t.string :data
      t.timestamps null: false
    end
  end
end
