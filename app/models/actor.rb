class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  validates :first_name, :last_name, presence: true

  def three_movies
    movies.take(3).pluck(:name).join(', ')  
  end
end
