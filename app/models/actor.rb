class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  validates :first_name, :last_name, presence: true

  scope :max_movies, -> { joins(:movies).group(:id)
                          .order("count(actor_id) desc").first.full_name }

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
