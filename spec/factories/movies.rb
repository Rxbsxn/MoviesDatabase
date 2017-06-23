FactoryGirl.define do
  factory :movie do
    name { Faker::Book.name }
    revenue { Faker::Number.number(5) }
    genre_id { Genre.first|| create(:genre).id }
  end
end
