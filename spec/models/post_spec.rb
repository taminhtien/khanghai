require 'rails_helper'

describe Post do
  context 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_attachment_content_type(:image).allowing('image/png', 'image/gif') }
  end

  context 'associations' do
    it { is_expected.to belong_to :category }
    it { is_expected.to belong_to :user }
  end
end
