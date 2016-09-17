class RenameFacebookIdToFacebookUrl < ActiveRecord::Migration
  def change
    rename_column :users, :facebook_id, :facebook_url
  end
end
