require 'rails_helper'

describe ServicesController do
  describe '#index' do
    def do_request
      get :index
    end

    it 'renders services#index page' do
      do_request
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    def do_request
      get :show, id: service
    end

    let!(:service) { create(:service) }

    it 'renders services#show page' do
      do_request
      expect(response).to render_template :show
    end
  end
end