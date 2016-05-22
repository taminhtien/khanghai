class Employee < ActiveRecord::Base
  has_many  :posts,       foreign_key: :author_id

  validates :name,        presence: true
  validates :position,    presence: true
  validates :description, presence: true
end