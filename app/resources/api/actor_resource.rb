class Api::ActorResource < JSONAPI::Resource
  attributes :first_name, :last_name

  has_many :actor_movies
  has_many :movies, through: :actor_movies
  has_many :awards

end
