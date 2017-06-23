require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  describe '#create' do
    let(:attributes) { attributes_for(:genre) }
    let(:call_request) { post :create, genre: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#update' do
    let!(:genre) { create(:genre) }
    let(:attributes) { attributes_for(:genre) }
    let(:call_request) { patch :update, id: genre.id, genre: attributes }

    it_behaves_like 'an action updating object', :name
  end

  describe '#destroy' do
    let!(:genre) { create(:genre) }
    let(:call_request) { delete :destroy, id: genre.id }

    it_behaves_like 'an action destroying object'
  end
end
