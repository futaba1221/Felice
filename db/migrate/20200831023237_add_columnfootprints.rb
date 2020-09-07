class AddColumnfootprints < ActiveRecord::Migration[5.0]
  def change
    add_column :footprints, :status, :boolean, default: false, null: false
  end
end
