require 'rails_helper'

describe HomeController do
  describe '#index' do
    def do_request
      get :index
    end

    it 'renders home#index page' do
      do_request
      expect(response).to render_template :index
    end
  end

  describe '#coming_soon' do
    def do_request
      get :coming_soon
    end

    it 'renders home#coming_soon page' do
      do_request
      expect(response).to render_template :coming_soon
    end
  end
end