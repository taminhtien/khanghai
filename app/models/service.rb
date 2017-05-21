class Service < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title, use: [:slugged, :finders]

  has_attached_file :picture, styles: { thumb: '255x170#' },
    default_url:  'services/picture/:style/missing.png'

  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ }

  validates :title, presence: true
  validates :short_description, presence: true
  validates :content, presence: true

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
