class AddColumnMemoToSearches < ActiveRecord::Migration[5.0]
  def change
    add_column :searches, :memo, :string
  end
end
