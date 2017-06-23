require 'rails_helper'

RSpec.describe ActorsController, type: :controller do
  describe '#create' do
    let(:attributes) { attributes_for(:actor) }
    let(:call_request) { post :create, actor: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#update' do
    let!(:actor) { create(:actor) }
    let(:attributes) { attributes_for(:actor) }
    let(:call_request) { patch :update, id: actor.id, actor: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let!(:actor) { create(:actor) }
    let(:call_request) { delete :destroy, id: actor.id }

    it_behaves_like 'an action destroying object'
  end
end
