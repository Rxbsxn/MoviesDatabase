class Award < ApplicationRecord
  ROLES = [:first_role, :second_role].freeze
  AWARD_TYPE = [:oscar, :cann].freeze
  enum role: ROLES
  enum award_type: AWARD_TYPE

  belongs_to :actor
  belongs_to :movie

  validates :role, :award_type, :actor, :movie, :year, presence: true
  validates :year, numericality: { only_integer: true }
end
