class AddPriorityToServices < ActiveRecord::Migration
  def change
    add_column :services, :priority, :integer, default: 0
  end
end
