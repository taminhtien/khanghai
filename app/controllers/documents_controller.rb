class DocumentsController < ApplicationController
  layout 'posts'
  before_action :set_document, only: [:show]

  def index
    @documents = Document.all.order(id: :desc)
    @documents = @documents.where(category_id: params[:category_id]) if params[:category_id].present?
    @documents = @documents.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @documents = @documents.paginate(page: params[:page], per_page: 10)
    @search_url = '/documents'
  end

  def show; end

  private

  def set_document
    @document = Document.find(params[:id])
  end
end
