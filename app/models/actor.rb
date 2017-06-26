class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies
  has_many :awards

  validates :first_name, :last_name, presence: true

  scope :max_movies, -> { joins(:movies).group(:id)
                          .order("count(actor_id) desc").first.full_name }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def three_movies
    movies.take(3).pluck(:name).join(' | ')
  end
end
