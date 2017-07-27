class Api::MovieResource < JSONAPI::Resource
  attributes :revenue, :name

  has_one :genre
  has_many :actors, through: :actor_movies
  has_many :actor_movies
  has_many :awards
end
