class AddDeletedAtColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :deleted_at, :datetims
  end
end
