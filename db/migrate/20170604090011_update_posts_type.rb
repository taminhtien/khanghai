class UpdatePostsType < ActiveRecord::Migration
  def change
    Post.all.update_all(type: :Post)
  end
end
