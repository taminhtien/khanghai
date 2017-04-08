class UpdateBirthdayField2 < ActiveRecord::Migration
  def change
    remove_column :customers, :birthday
    add_column :customers, :birthday, :integer
  end
end
