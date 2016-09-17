require 'rails_helper'

describe PagesController do
  describe '#about_us' do
    def do_request
      get :about_us
    end

    it 'renders pages#about_us page' do
      do_request
      expect(response).to render_template :about_us
    end
  end
end