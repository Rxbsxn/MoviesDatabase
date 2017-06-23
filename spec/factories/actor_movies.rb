FactoryGirl.define do
  factory :actor_movie do
    actor_id { Actor.first || create(:actor).id }
    movie_id { Movie.first || create(:movie).id }
  end
end
