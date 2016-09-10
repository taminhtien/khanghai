class RenameFeedbacksToContacts < ActiveRecord::Migration
  def change
    rename_table :feedbacks, :contacts
  end
end
