class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.belongs_to :name
      t.timestamps
    end

    create_table :blogs do |t|
      t.string :title
      t.text :content
      t.integer :user_id
    end

    create_table :favorites do |t|
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
