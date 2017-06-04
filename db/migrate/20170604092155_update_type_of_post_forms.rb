class UpdateTypeOfPostForms < ActiveRecord::Migration
  def change
    Post.where(type: nil).update_all(type: :Form)
  end
end
