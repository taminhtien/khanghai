class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.text :description
      t.string :facebook_id
    end
  end
end
