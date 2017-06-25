class Post < ActiveRecord::Base
  extend FriendlyId
  extend Enumerize

  belongs_to :category
  belongs_to :user

  friendly_id :title, use: [:slugged, :finders]
  enumerize :type, in: [:Form, :QuestionAndAnswer, :New, :Document]

  has_attached_file :attachment
  has_attached_file :picture, styles: { thumb: '848x480#' }, default_url:  'posts/pictures/:style/missing.jpg'

  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }, size: { less_than: 5.megabyte }
  validates_attachment :attachment, :content_type => { :content_type => Rails.application.config.form_attachment_types }, :size => { :less_than => 10.megabyte }

  validates :title,       presence: true
  validates :content,     presence: true
  validates :category_id, presence: true
  validates :user_id,     presence: true
end
