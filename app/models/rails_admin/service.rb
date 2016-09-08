module RailsAdmin::Service
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :title
        field :content, :ck_editor
        field :picture
      end
    end
  end
end
