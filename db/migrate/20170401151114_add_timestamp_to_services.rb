class AddTimestampToServices < ActiveRecord::Migration
  def change
    add_column :services, :created_at, :datetime, default: Time.current
    add_column :services, :updated_at, :datetime, default: Time.current
  end
end
