class ActorMovie < ApplicationRecord
  belongs_to :actor
  belongs_to :movie

  validates :actor, :movie, presence: true
end
