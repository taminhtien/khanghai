class MoveFormsToPosts < ActiveRecord::Migration
  def change
    Form.all.each do |form|
      Post.create!(title: form.title, content: form.content, category_id: form.category_id, slug: form.slug, created_at: form.created_at, updated_at: form.updated_at, attachment: form.attachment, user: User.first)
    end
  end
end
