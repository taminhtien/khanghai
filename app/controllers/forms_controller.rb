class FormsController < ApplicationController
  layout 'forms'
  before_action :set_form, only: [:show]

  def index
    @forms = Form.all
    @forms = @forms.where(category_id: params[:category_id]) if params[:category_id].present?
    @forms = @forms.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @forms = @forms.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  private

  def set_form
    @form = Form.find(params[:id])
  end
end
