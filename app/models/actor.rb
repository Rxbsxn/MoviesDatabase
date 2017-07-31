class Actor < ApplicationRecord
  has_many :actor_movies, dependent: :destroy
  has_many :movies, through: :actor_movies
  has_many :awards

  validates :first_name, :last_name, presence: true

  scope :max_movies, -> { joins(:movies).group(:id)
                          .order("count(actor_id) desc").first.full_name }

  scope :most_first_roles, -> { joins(:awards).group(:id).where("role = 0")
                                .order("count(actor_id) desc").first.full_name }

  scope :most_second_roles, -> { joins(:awards).group(:id).where("role = 1")
                                .order("count(actor_id) desc").first.full_name }

  def self.greatest_actor
    all.max_by { |actor| actor.points }.full_name
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def name
    full_name
  end

  def points
    (awards.where("role = 0").count * 3) + (awards.where("role = 1").count * 1)
  end

  def three_movies
    movies.take(3).pluck(:name).join(' | ')
  end
end
