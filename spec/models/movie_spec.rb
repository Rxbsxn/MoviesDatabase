require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'Movie count' do
    it 'empty table' do
      expect(Movie.count).to eq 0
    end
  end
  it 'one genre in table' do
    create(:movie)
    expect(Movie.count).to eq 1
  end

  describe 'Movie is valid' do
    let(:movie) { create(:movie) }
    it 'returns valid record' do
      expect(movie).to be_valid
    end
  end

  describe 'Movie attribs validation' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:genre) }
    it { should validate_numericality_of(:revenue) }
  end

  describe 'should have many movies' do
    it { should have_many(:actors) }
  end
  
  describe 'should belong_to genre' do
    it { should belong_to(:genre) }
  end
end
