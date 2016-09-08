class AddPictureToServices < ActiveRecord::Migration
  def change
    add_attachment :services, :picture
  end
end
