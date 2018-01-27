class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :blogs do |t|
      t.belongs_to :user, index: true
      t.datetime :published_at
      t.timestamps
    end

    create_table :favorites do |t|
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end
