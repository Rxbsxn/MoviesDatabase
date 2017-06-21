require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'Genre count' do
    it 'empty table' do
      expect(Genre.count).to eq 0
    end
  end
  it 'one genre in table' do
    create(:genre)
    expect(Genre.count).to eq 1
  end

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
end
