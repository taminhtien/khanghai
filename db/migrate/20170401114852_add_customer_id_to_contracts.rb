class AddCustomerIdToContracts < ActiveRecord::Migration
  def change
    add_reference :contracts, :customer, index: true
  end
end
