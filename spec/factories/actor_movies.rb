FactoryGirl.define do
  factory :actor_movie do
    actor_id { Actor.all.sample.id }
    movie_id { Movie.all.sample.id }
  end
end
