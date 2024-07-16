class RemoveIdFromPostImages < ActiveRecord::Migration[6.1]
  def change
    remove_column :post_images, :id, :integer
  end
end
