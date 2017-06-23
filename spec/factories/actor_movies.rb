FactoryGirl.define do
  factory :actor_movie do
    actor { Actor.all.sample || create(:actor) }
    movie { Movie.all.sample || create(:movie) }
  end
end
