class AddShortDescriptionToServices < ActiveRecord::Migration
  def change
    add_column :services, :short_description, :string
  end
end
