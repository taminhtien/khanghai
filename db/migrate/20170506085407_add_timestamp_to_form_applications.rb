class AddTimestampToFormApplications < ActiveRecord::Migration
  def change
    add_timestamps :form_applications
  end
end
