class PagesController < ApplicationController
  layout 'pages'
  
  def about_us
    @employees = User.where.not(role: :admin)
  end
end  