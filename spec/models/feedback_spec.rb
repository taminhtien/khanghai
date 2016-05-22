require 'rails_helper'

describe Feedback do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_presence_of :phone_number }
    it { is_expected.to validate_presence_of :subject }
    it { is_expected.to validate_presence_of :message }
  end
end