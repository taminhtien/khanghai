class Form < ActiveRecord::Base
  extend FriendlyId

  belongs_to :form_category, foreign_key: :category_id

  friendly_id :title, use: [:slugged, :finders]

  has_attached_file :attachment

  validates_attachment :attachment,
    :content_type => { :content_type => Rails.application.config.form_attachment_types },
    :size => { :less_than => 10.megabyte }

  validates :title,       presence: true
  validates :content,     presence: true
  validates :category_id, presence: true
end
