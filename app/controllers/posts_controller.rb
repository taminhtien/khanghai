class PostsController < ApplicationController
  layout 'posts'
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
    @posts = @posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @posts = @posts.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @posts = @posts.paginate(page: params[:page], per_page: 10)
  end

  def show; end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end