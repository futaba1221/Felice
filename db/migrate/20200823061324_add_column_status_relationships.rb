class AddColumnStatusRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :status, :boolean, default: false, null: false
  end
end
