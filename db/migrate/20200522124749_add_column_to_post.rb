class AddColumnToPost < ActiveRecord::Migration[5.0]
  def change
    rename_column :posts, :image, :images
  end
end

