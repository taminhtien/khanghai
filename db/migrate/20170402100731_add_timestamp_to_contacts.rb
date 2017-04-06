class AddTimestampToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :created_at, :datetime, default: Time.current
    add_column :contacts, :updated_at, :datetime, default: Time.current
  end
end
