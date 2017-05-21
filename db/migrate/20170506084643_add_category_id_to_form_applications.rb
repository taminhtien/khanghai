class AddCategoryIdToFormApplications < ActiveRecord::Migration
  def change
    add_reference :form_applications, :category, index: true
  end
end
