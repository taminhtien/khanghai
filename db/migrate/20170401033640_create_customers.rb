class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :permanent_address
      t.string :contact_address
      t.string :phone_number
    end
  end
end
