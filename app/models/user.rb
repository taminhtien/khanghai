class User < ActiveRecord::Base
  extend Enumerize

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many  :posts, dependent: :destroy

  has_attached_file    :picture, styles:       { medium: '353x235#' },
                                 default_url:  'users/picture/:style/missing.png'

  enumerize :role, in: [:admin, :staff]
  enumerize :salutation, in: [:mr, :mrs, :miss, :ms], default: :mr

  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ },
                                 size:         { less_than: 5.megabyte }

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true
  validates :description, presence: true
  validates :job_title, presence: true
  validates :salutation,    presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
