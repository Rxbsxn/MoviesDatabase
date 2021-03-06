class Genre < ApplicationRecord
  has_many :movies, dependent: :destroy

  validates :name, presence: true

  scope :most_popular, -> { joins(:movies).group(:id)
                            .order('count(genre_id) desc').first.name }
end
