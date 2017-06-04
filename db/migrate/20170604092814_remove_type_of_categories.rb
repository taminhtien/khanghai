class RemoveTypeOfCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :type
  end
end
