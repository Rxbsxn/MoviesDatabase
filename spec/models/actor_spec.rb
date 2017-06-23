require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'Actor is valid' do
    let(:actor) { create(:actor) }
    it 'returns valid record' do
      expect(actor).to be_valid
    end
  end

  describe 'Actor attribs validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'should have many movies and actor_movies' do
    it { should have_many(:movies) }
    it { should have_many(:actor_movies) }
  end

  describe '.max_movies' do
    let(:actor) { create(:actor) }
    let(:actor2) { create(:actor) }
    let(:movie) { create(:movie) }
    let(:movie2) { create(:movie) }
    let(:movie3) { create(:movie) }
    it 'should returns actor who has highest number of films' do
      actor.movies.push(movie, movie2, movie3)
      actor2.movies.push(movie, movie2)
      expect(Actor.max_movies).to eq actor.full_name
    end
  end 
end
