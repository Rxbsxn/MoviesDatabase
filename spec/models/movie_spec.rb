require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Movie is valid' do
    let(:movie) { create(:movie) }
    it 'returns valid record' do
      expect(movie).to be_valid
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
    let(:movie) { create(:movie) }
    let(:movie2) { create(:movie) }
    
    it 'returns movie with maximum value' do
      movie.update_attributes(revenue: 99999999)
      expect(Movie.max_revenue).to eq movie.name
    end
  end
end
