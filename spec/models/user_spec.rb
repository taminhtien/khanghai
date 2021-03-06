require 'rails_helper'

describe User do
  context 'validations' do
    it { is_expected.to validate_presence_of :first_name }
    it { is_expected.to validate_presence_of :last_name }
    it { is_expected.to validate_presence_of :role }
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :salutation }
    it { is_expected.to validate_presence_of :job_title }
    it { is_expected.to enumerize(:role).in(:admin, :staff) }
    it { is_expected.to enumerize(:salutation).in(:mr, :mrs, :ms) }
  end

  context 'associations' do
    it { is_expected.to have_many :posts }
  end
end
