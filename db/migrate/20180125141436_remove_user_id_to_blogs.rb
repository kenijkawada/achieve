class RemoveUserIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    remove_column :blogs, :user_id, :integer
  end
end
