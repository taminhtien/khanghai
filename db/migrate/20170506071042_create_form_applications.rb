class CreateFormApplications < ActiveRecord::Migration
  def change
    create_table :form_applications do |t|
      t.string :title
      t.string :content
      t.attachment :form
    end
  end
end
