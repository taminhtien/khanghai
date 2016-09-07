class UpdateServicesTable < ActiveRecord::Migration
  def change
    remove_column :our_services, :slug
    rename_table :our_services, :services
    add_column :services, :slug, :string
    add_index :services, :slug
  end
end
