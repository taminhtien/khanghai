require 'rails_helper'

describe Contract do
  context 'associations' do
    it { is_expected.to belong_to :customer }
    it { is_expected.to have_many :contract_attachments }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of :customer }
    it { is_expected.to validate_presence_of :code }
    it { is_expected.to validate_presence_of :type }
    it { is_expected.to validate_presence_of :summary }
    it { is_expected.to validate_presence_of :requirement }
    it { is_expected.to validate_presence_of :development }
    it { is_expected.to validate_presence_of :assignee }
  end
end
