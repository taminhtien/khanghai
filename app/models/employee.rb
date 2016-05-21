class Employee < ActiveRecord::Base
  validates :name,        presence: true
  validates :position,    presence: true
  validates :description, presence: true
end