class Contract < ActiveRecord::Base
  extend Enumerize
  self.inheritance_column = :_type_disabled

  belongs_to :customer

  enumerize :type, in: [:civil, :criminal, :land, :administration, :labor, :others]

  validates :customer_id, presence: true
  validates :code, presence: true
  validates :type, presence: true
  validates :summary, presence: true
  validates :requirement, presence: true
  validates :development, presence: true
  validates :propose_assignee, presence: true
end
