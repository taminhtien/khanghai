require 'rails_helper'

describe Employee do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :position }
    it { is_expected.to validate_presence_of :description }
  end

  context 'associations' do
    it { is_expected.to have_many :posts }
  end
end