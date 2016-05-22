class AddIndexesToNews < ActiveRecord::Migration
  def change
    add_reference :news, :category, index: true
    add_reference :news, :author, index: true
  end
end
