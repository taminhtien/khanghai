class RenameAttachmentFormFromFormApplications < ActiveRecord::Migration
  def change
    rename_column :forms, :form_file_name, :attachment_file_name
    rename_column :forms, :form_file_size, :attachment_file_size
    rename_column :forms, :form_content_type, :attachment_content_type
    rename_column :forms, :form_updated_at, :attachment_updated_at   
  end
end
