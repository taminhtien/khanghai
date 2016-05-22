class AddSlugToOurServices < ActiveRecord::Migration
  def change
    add_column :our_services, :slug, :string
    add_index :our_services, :slug, unique: true
  end
end
