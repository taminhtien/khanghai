class QnasController < ApplicationController
  layout 'posts'
  before_action :set_qna, only: [:show]

  def index
    @qnas = QuestionAndAnswer.all.order(id: :desc)
    @qnas = @qnas.where(category_id: params[:category_id]) if params[:category_id].present?
    @qnas = @qnas.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @qnas = @qnas.paginate(page: params[:page], per_page: 10)
    @search_url = '/qnas'
  end

  def show; end

  private

  def set_qna
    @qna = QuestionAndAnswer.find(params[:id])
  end
end
