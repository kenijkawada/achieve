class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {in: 1..140}

  validates :user_id, presence: true
  belongs_to :user, optional: true, foreign_key: 'user_id'
end
