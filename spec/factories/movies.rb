FactoryGirl.define do
  factory :movie do
    name { Faker::Company.name }
    revenue { Faker::Number.number(5) }
    genre_id { Genre.all.sample || create(:genre).id }
  end
end
