class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, class_name: Employee, foreign_key: :author_id

  validates :title,   presence: true
  validates :content, presence: true
end