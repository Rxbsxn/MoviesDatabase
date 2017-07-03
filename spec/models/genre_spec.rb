require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Genre is valid' do
    it 'returns valid record' do
      create(:genre) 
      expect(Genre.first).to be_valid
    end
  end

  describe 'Genre attribs validation' do
    it { should validate_presence_of(:name) }
  end

  describe 'should have many movies' do
    it { should have_many(:movies) }
  end

  describe '.most_popular' do
    it 'should returns most popular genre' do
      create(:genre, id: 10, movies: [create(:movie), create(:movie)])
      create(:genre, movies: [create(:movie)])
      genre = Genre.find(10)

      expect(Genre.most_popular).to eq genre.name
    end    
  end
end
