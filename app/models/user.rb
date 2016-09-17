class User < ActiveRecord::Base
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :posts, dependent: :destroy

  has_attached_file    :picture, styles:       { medium: '353x235#' },
                                 default_url:  'users/picture/:style/missing.png'

  enumerize :role, in: [:admin, :employee, :ceo], default: :employee

  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ },
                                 size:         { less_than: 5.megabyte }

  validates :name, presence: true
  validates :role, presence: true
  validates :description, presence: true
end
