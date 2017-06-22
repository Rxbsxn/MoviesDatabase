require 'rails_helper'

RSpec.describe ActorMovie, type: :model do
  describe 'ActorMovie is valid' do
    let(:actor_movies) { create(:actor_movie) }
    it 'returns valid record' do
      expect(actor_movies).to be_valid
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
