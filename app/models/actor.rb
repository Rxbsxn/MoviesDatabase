class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  validates :first_name, presence: true
  validates :last_name, presence: true
end
