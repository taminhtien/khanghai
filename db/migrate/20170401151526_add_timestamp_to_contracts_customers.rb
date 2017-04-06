class AddTimestampToContractsCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :created_at, :datetime, default: Time.current
    add_column :customers, :updated_at, :datetime, default: Time.current
    add_column :contracts, :created_at, :datetime, default: Time.current
    add_column :contracts, :updated_at, :datetime, default: Time.current
    add_column :users, :created_at, :datetime, default: Time.current
    add_column :users, :updated_at, :datetime, default: Time.current
  end
end
