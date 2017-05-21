class UpdateContracts < ActiveRecord::Migration
  def change
    rename_column :contracts, :assignee, :assigner
    rename_column :contracts, :propose_assignee, :assignee
    add_column :contracts, :approved_date, :datetime
  end
end
