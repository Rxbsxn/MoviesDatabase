class Api::AwardResource < JSONAPI::Resource
  attributes :role, :year, :award_type

  has_one :actor
  has_one :movie
end
