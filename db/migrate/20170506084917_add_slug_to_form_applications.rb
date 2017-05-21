class AddSlugToFormApplications < ActiveRecord::Migration
  def change
    add_column :form_applications, :slug, :string
  end
end
