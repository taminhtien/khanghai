require 'rails_helper'

describe ContactsController do
  describe '#new' do
    def do_request
      get :new
    end

    it 'renders contacts#new page' do
      do_request
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    def do_request
      get :create, contact: contact_params
    end

    context 'success' do
      let(:contact_params) { attributes_for(:contact) }

      it 'creates new contact' do
        expect { do_request }.to change(Contact, :count).by(1)
      end

      it 'redirects to contact us page' do
        do_request
        expect(response).to redirect_to contact_us_path
      end
    end

    context 'failure' do
      let(:contact_params) { attributes_for(:contact, email: '') }

      it 'does not create new contact' do
        expect { do_request }.to change(Contact, :count).by(0)
      end

      it 'renders contacts#new page' do
        do_request
        expect(response).to render_template :new
      end
    end
  end
end