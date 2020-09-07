class AddUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :prefecture_id, :string
    add_column :users, :birthplace_id, :string
    add_column :users, :marriage, :string
    add_column :users, :children, :string
    add_column :users, :intention, :string
    add_column :users, :housework, :string
    add_column :users, :hope, :string
    add_column :users, :housemate, :string
    add_column :users, :holiday, :string
    add_column :users, :liquor, :string
    add_column :users, :tobacco, :string
    add_column :users, :like, :string
    add_column :users, :self_pr, :text
    add_column :users, :deleted_at, :date
  end
end
