FactoryGirl.define do
  factory :award do
    actor { Actor.all.sample || create(:actor) }
    movie { Movie.all.sample || create(:movie) }
    award_type { Award.award_types.keys.sample }
    role { Award.roles.keys.sample }
    year 1999
  end
end

