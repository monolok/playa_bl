class AddCommentToClients < ActiveRecord::Migration
  def change
    add_column :clients, :comment, :text
  end
end