class UpdateFieldsInContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :result, :text
    add_column :contracts, :action, :text
    remove_column :contracts, :approved_date
    rename_column :contracts, :assigned_date, :approved_date
  end
end
