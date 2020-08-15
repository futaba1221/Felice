class AddColumnToUser < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :image_name, :image_names
  end
end
