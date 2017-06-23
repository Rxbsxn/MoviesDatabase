class Movie < ApplicationRecord
  belongs_to :genre
  has_many :actors, through: :actor_movies
  has_many :actor_movies

  validates :name, :genre, presence: true
  validates :revenue, numericality: true
end
