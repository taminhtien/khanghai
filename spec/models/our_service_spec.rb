require 'rails_helper'

describe OurService do
  context 'associations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
  end
end