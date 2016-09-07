class User < ActiveRecord::Base
  has_many  :posts, dependent: :destroy

  validates :name,        presence: true
  validates :position,    presence: true
  validates :description, presence: true
end