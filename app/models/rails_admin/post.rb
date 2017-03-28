module RailsAdmin::Post
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :title
        field :content, :ck_editor
        field :category
        field :user
        field :picture
        field :slug
      end
    end
  end
end
