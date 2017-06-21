class ActorMovie < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  
  validates :actor_id, presence: true
  validates :movie_id, presence: true
end
