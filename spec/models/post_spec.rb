require 'rails_helper'

describe Post do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end

  context 'associations' do
    it { is_expected.to belong_to :category }
    it { is_expected.to belong_to :author }
  end
end