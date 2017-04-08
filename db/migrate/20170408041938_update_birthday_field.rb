class UpdateBirthdayField < ActiveRecord::Migration
  def change
    remove_column :customers, :birthday
    add_column :customers, :birthday, :string
  end
end
