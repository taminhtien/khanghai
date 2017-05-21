class FormCategory < Category
  has_many :forms, dependent: :destroy, foreign_key: :category_id
end
