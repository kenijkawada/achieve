class Blog < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {in: 1..140}

  belongs_to :user, optional: true, foreign_key: 'user_id'
  has_many :favorites, dependent: :destroy
  has_many :favorite_user, through: :favorites, source: :user
end
