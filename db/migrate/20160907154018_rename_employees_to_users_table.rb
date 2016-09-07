class RenameEmployeesToUsersTable < ActiveRecord::Migration
  def change
    rename_table :employees, :users
  end
end
