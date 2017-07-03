require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'Actor is valid' do
    it 'returns valid record' do
      create(:actor)
      expect(Actor.first).to be_valid
    end
  end

  describe 'Actor attribs validation' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'should have many movies, actor_movies and awards' do
    it { should have_many(:movies) }
    it { should have_many(:actor_movies) }
    it { should have_many(:awards) }
  end

  describe '.max_movies' do
    it 'should returns actor who has highest number of films' do
      create(:actor, movies: [create(:movie), create(:movie)])
      create(:actor, movies: [create(:movie)])

      expect(Actor.max_movies).to eq Actor.first.full_name
    end
  end

  describe '.most_first_roles' do
    it('returns actor with most first roles award') do
      create(:actor, id: 10, awards: [create(:award, role: 0), create(:award, role: 0)])
      create(:actor, awards: [create(:award, role: 0)])
      actor = Actor.find(10)

      expect(Actor.most_first_roles).to eq actor.full_name
    end
  end

  describe '.most_second_roles' do
    it('returns actor with most second roles award') do
      create(:actor, id: 10, awards: [create(:award, role: 1), create(:award, role: 1)])
      create(:actor, awards: [create(:award, role: 1)])
      actor = Actor.find(10)

      expect(Actor.most_second_roles).to eq actor.full_name
    end
  end

  describe '.greatest_actor' do
    context 'Actor with 4 second role greater than 1 first' do
      it 'returns greater actor' do
        create(:actor, id: 10, awards: [create(:award, role: 1), create(:award, role: 1),
                                        create(:award, role: 1), create(:award, role: 1)])
        create(:actor, awards: [create(:award, role: 0)])
        actor = Actor.find(10)

        expect(Actor.greatest_actor).to eq actor.full_name
      end
    end

    context 'Actor with 1 first role greater than 2 seconds' do
      it 'returns greater actor with 1 first_role' do
        create(:actor, id: 10, awards: [create(:award, role: 0)])
        create(:actor, awards: [create(:award, role: 1), create(:award, role: 1)])
        actor = Actor.find(10)

        expect(Actor.greatest_actor).to eq actor.full_name
      end
    end
  end
end
