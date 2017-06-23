FactoryGirl.define do
  factory :actor_movie do
    actor { Actor.all.sample || create(:actor).id }
    movie { Movie.all.sample || create(:movie).id }
  end
end
