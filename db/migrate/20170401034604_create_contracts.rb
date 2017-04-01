class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :code
      t.string :type
      t.string :assignee
      t.datetime :assigned_date
      t.datetime :estimate_completed_date
      t.text :summary
      t.text :requirement
      t.text :development
      t.string :propose_assignee
    end
  end
end
