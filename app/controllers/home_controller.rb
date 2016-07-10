class HomeController < ApplicationController
  layout 'coming_soon', only: [:coming_soon]

  def index; end
  def coming_soon; end
end
