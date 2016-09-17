require 'rails_helper'

describe User do
  context 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :role }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to enumerize(:role).in(:admin, :employee, :ceo) }
  end

  context 'associations' do
    it { is_expected.to have_many :posts }
  end
end