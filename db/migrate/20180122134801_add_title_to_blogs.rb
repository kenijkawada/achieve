class AddTitleToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :title, :string
  end
end
