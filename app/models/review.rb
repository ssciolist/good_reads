class Review < ApplicationRecord
  validates :user_rating, :body, presence: true
  belongs_to :user
  belongs_to :book
end
