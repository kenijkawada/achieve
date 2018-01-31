class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, unique: true
  end
end
