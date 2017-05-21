class FormsController < ApplicationController
  layout 'posts'
  before_action :set_form, only: [:show]

  def index
    #@ceo = User.find_by_role(:ceo)  
    @forms = Form.all.paginate(page: params[:page], per_page: 10)
    #@posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    #@posts = @posts.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    #@posts = @posts.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  private

  def set_form
    @form = Form.find(params[:id])
  end
end
