FactoryGirl.define do
  factory :award do
    actor { Actor.all.sample || create(:actor) }
    movie { Movie.all.sample || create(:movie) }
    award_type 0 
    role 0
    year 1999
  end
end

