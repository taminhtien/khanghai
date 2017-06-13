class NewPostsController < ApplicationController
  layout 'posts'
  before_action :set_new_post, only: [:show]

  def index
    @new_posts = New.all.order(id: :desc)
    @new_posts = @new_posts.where(category_id: params[:category_id]) if params[:category_id].present?
    @new_posts = @new_posts.where('title ILIKE ?', "%#{params[:q]}%") if params[:q].present?
    @new_posts = @new_posts.paginate(page: params[:page], per_page: 10)
    @search_url = '/news'
  end

  def show; end

  private

  def set_new_post
    @new_post = New.find(params[:id])
  end
end
