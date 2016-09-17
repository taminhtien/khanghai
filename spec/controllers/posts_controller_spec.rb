require 'rails_helper'

describe PostsController do
  describe '#index' do
    def do_request
      get :index
    end

    it 'renders posts#index page' do
      do_request
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    def do_request
      get :show, id: post
    end

    let!(:post) { create(:post) }

    it 'renders posts#show page' do
      do_request
      expect(response).to render_template :show
    end
  end
end