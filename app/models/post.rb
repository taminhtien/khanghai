class Post < ActiveRecord::Base
  extend FriendlyId

  belongs_to :category
  belongs_to :user

  friendly_id :title, use: [:slugged, :finders]

  has_attached_file    :picture, styles:       { large: '848x480#' },
                                 default_url:  'posts/picture/:style/missing.png'

  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ },
                                 size:         { less_than: 5.megabyte }
  
  validates :title,       presence: true
  validates :content,     presence: true
  validates :category_id, presence: true
  validates :user_id,     presence: true
end
