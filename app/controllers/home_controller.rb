class HomeController < ApplicationController
  layout 'coming_soon', only: [:coming_soon]

  def index
    @posts = Post.order(created_at: :asc).limit(5)
    @services = Service.all
    @major_services = @services[0..2]
    @minor_services = @services[3..-1]
    @employees = User.where.not(role: :admin)
  end

  def coming_soon; end
end
