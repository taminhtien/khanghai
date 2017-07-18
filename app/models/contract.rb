class Contract < ActiveRecord::Base
  self.inheritance_column = :_type_disabled
  extend Enumerize

  belongs_to :customer
  has_many :contract_attachments, inverse_of: :contract, dependent: :destroy

  enumerize :type, in: [:civil, :criminal, :land, :administration, :labor, :others]
  accepts_nested_attributes_for :contract_attachments, reject_if: :all_blank, allow_destroy: true

  validates :customer, presence: true
  validates :code, presence: true
  validates :type, presence: true
  validates :summary, presence: true
  validates :requirement, presence: true
  validates :development, presence: true
  validates :assignee, presence: true

  rails_admin do
    edit do
      include_all_fields
      field :summary, :ck_editor
      field :requirement, :ck_editor
      field :development, :ck_editor
      field :result, :ck_editor
      field :action, :ck_editor
    end
  end
end
