class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :contract_attachments do |t|
      t.attachment :attachment
      t.references :contract, index: true
    end
  end
end
