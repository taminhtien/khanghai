require 'rails_helper'

describe Post do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :category }
    it { is_expected.to validate_presence_of :user }
  end

  context 'associations' do
    it { is_expected.to belong_to :category }
    it { is_expected.to belong_to :user }
  end
end
