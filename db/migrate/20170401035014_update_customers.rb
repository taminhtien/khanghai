class UpdateCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :birthday, :datetime
  end
end
