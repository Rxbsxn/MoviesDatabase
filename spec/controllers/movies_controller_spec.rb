require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe '#create' do
    let(:attributes) { attributes_for(:movie) }
    let(:call_request) { post :create, movie: attributes }

    it_behaves_like 'an action creating object'
  end

  describe '#update' do
    let!(:movie) { create(:movie) }
    let(:attributes) { attributes_for(:movie) }
    let(:call_request) { patch :update, id: movie.id, movie: attributes }

    it_behaves_like 'an action updating object'
  end

  describe '#destroy' do
    let!(:movie) { create(:movie) }
    let(:call_request) { delete :destroy, id: movie.id }

    it_behaves_like 'an action destroying object'
  end
end
