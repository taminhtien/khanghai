require 'rails_helper'

describe Customer do
  context 'associations' do
    it { is_expected.to have_many :contracts }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :name }
  end
end
