class HomeController < ApplicationController
  layout 'coming_soon', only: [:coming_soon]

  def index
    @posts = Post.where(type: :Post).order(created_at: :asc).limit(5)
    @forms = Form.order(created_at: :asc).limit(5)
    @services = Service.all.order(priority: :asc)
    @employees = User.where.not(role: :admin)
  end

  def coming_soon; end
end
