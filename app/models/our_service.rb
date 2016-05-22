class OurService < ActiveRecord::Base
  extend FriendlyId

  friendly_id :title,   use: [:slugged, :finders]

  validates   :title,   presence: true
  validates   :content, presence: true

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end