class UpdatePostsTable < ActiveRecord::Migration
  def change
    remove_reference :posts, :author, index: true
    add_reference :posts, :user, index: true
  end
end
