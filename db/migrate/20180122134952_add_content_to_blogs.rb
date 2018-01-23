class AddContentToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :content, :text
  end
end
