class Movie < ApplicationRecord
  belongs_to :genre
  has_many :actors, through: :actor_movies
  has_many :actor_movies
  has_many :awards

  validates :name, :genre_id, :revenue, presence: true
  validates :revenue, numericality: true

  scope :max_revenue, -> { order(revenue: :desc).first.name }
end
