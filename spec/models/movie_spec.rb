require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Movie is valid' do
    it 'returns valid record' do
      create(:movie)
      expect(Movie.first).to be_valid
    end
  end

  describe 'Movie attribs validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:genre_id) }
    it { should validate_numericality_of(:revenue) }
  end

  describe 'should have many actors' do
    it { should have_many(:actors) }
  end

  describe 'should belong_to genre' do
    it { should belong_to(:genre) }
  end

  describe '.max_revenue' do
    it 'returns movie with maximum value' do    
      create(:movie, id: 5, revenue: 99999999)
      create(:movie)
      movie = Movie.find(5)

      expect(Movie.max_revenue).to eq movie.name
    end
  end

  describe '.greatest_movie' do
    it 'returns greatest movie' do
      create(:movie, id: 10, awards: [create(:award), create(:award)])
      create(:movie, awards: [create(:award)])
      movie = Movie.find(10)

      expect(Movie.greatest_movie).to eq movie.name
    end
  end
end
