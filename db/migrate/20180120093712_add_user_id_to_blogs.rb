class AddUserIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_index :blogs, :user_id
  end
end
