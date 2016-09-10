class AddTimestampsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :created_at, :datetime, default: Time.current
    add_column :posts, :updated_at, :datetime, default: Time.current
  end
end
