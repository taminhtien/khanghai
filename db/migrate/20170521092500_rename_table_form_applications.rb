class RenameTableFormApplications < ActiveRecord::Migration
  def change
    rename_table :form_applications, :forms
  end
end
