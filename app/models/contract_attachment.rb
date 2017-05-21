class ContractAttachment < ActiveRecord::Base
  belongs_to :contract
  has_attached_file :attachment
  
  validates_attachment :attachment,
    :content_type => { :content_type => Rails.application.config.form_attachment_types },
    :size => { :less_than => 10.megabyte }
end
