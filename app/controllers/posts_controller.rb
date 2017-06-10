class PostsController < ApplicationController
  layout 'posts'
  before_action :set_post, only: [:show]

  def index
    @posts = Post.where(type: :Post).order(id: :desc)
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @posts = @posts.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @posts = @posts.paginate(page: params[:page], per_page: 10)
    @search_url = '/posts'
  end

  def show; end

  def news
    @posts = Post.where(type: :New).order(id: :desc)
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @posts = @posts.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @posts = @posts.paginate(page: params[:page], per_page: 10)
    @search_url = '/posts/news'
    render :index
  end

  def documents
    @posts = Post.where(type: :Document).order(id: :desc)
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @posts = @posts.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @posts = @posts.paginate(page: params[:page], per_page: 10)
    @search_url = '/posts/documents'
    render :index
  end

  def question_and_answers
    @posts = Post.where(type: :QuestionAndAnswer).order(id: :desc)
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @posts = @posts.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @posts = @posts.paginate(page: params[:page], per_page: 10)
    @search_url = '/posts/question_and_answers'
    render :index
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
