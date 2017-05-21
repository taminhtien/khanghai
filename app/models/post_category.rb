class PostCategory < Category
  has_many :posts, dependent: :destroy, foreign_key: :category_id
end
