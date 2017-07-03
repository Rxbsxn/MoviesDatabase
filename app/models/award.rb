class Award < ApplicationRecord
  enum role: [:first_role, :second_role]
  enum award_type: [:oscar, :cann]

  belongs_to :actor
  belongs_to :movie

  ransack_alias :actor, :actor_first_name_or_actor_last_name

  validates :role, :award_type, :actor_id, :movie_id, :year, presence: true
  validates :year, numericality: { only_integer: true }
end
