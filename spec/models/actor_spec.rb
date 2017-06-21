require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'Actor count' do
    it 'empty table' do
      expect(Actor.count).to eq 0
    end
  end
  it 'one genre in table' do
    create(:actor)
    expect(Actor.count).to eq 1
  end

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
end
