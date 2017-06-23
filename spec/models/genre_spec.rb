require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Genre is valid' do
    let(:genre) { create(:genre) }
    it 'returns valid record' do
      expect(genre).to be_valid
    end
  end

  describe 'Genre attribs validation' do
    it { should validate_presence_of(:name) }
  end

  describe 'should have many movies' do
    it { should have_many(:movies) }
  end

  describe '.most_popular' do
    let(:genre) { create(:genre) }
    let(:genre2) { create(:genre) }
    let(:movie) { create(:movie) }
    let(:movie2) { create(:movie) }
    let(:movie3) { create(:movie) }

    it 'should returns most popular genre' do
      genre.movies.push(movie, movie2)
      genre2.movies.push(movie3)
      expect(Genre.most_popular).to eq genre.name
    end    
  end
end
