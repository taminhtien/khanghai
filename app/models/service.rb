class Service < ActiveRecord::Base
  include RailsAdmin::Service
  extend FriendlyId

  friendly_id :title,   use: [:slugged, :finders]

  has_attached_file    :picture, styles:       { thumb: '255x170#' },
                                 default_url:  'services/pictures/:style/missing.png'

  validates_attachment :picture, content_type: { content_type: /\Aimage\/.*\Z/ },
                                 size:         { less_than: 5.megabyte }

  validates   :title,   presence: true
  validates   :content, presence: true

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end