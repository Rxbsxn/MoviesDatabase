require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  describe 'ActorMovie count' do
    it 'empty table' do
      expect(ActorMovie.count).to eq 0
    end
  end
  it 'one genre in table' do
    create(:actor_movie)
    expect(ActorMovie.count).to eq 1
  end

  describe 'ActorMovie is valid' do
    let(:actor_movies) { create(:actor_movie) }
    it 'returns valid record' do
      expect(actor_movies).to be_valid
    end
  end

  describe 'should have many movies and actor_movies' do
    it { should belong_to(:movie) }
    it { should belong_to(:actor) }
  end  
end
