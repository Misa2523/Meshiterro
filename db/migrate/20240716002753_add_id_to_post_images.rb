class AddIdToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :id, :integer
  end
end
