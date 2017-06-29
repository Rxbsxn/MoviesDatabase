require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  describe 'ActorMovie is valid' do
    it 'returns valid record' do
      create(:actor_movie)

      expect(ActorMovie.first).to be_valid
    end
  end

  describe 'ActorMovie attribs validation' do
    it { should validate_presence_of(:actor) }
    it { should validate_presence_of(:movie) }
  end

  describe 'should have many movies and actor_movies' do
    it { should belong_to(:movie) }
    it { should belong_to(:actor) }
  end  
end
