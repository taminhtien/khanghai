class Category < ActiveRecord::Base
  extend Enumerize

  enumerize :type, in: [:PostCategory, :FormCategory]

  validates :name,  presence: true
end
