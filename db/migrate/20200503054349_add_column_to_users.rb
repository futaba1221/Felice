class AddColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :blood, :string
    add_column :users, :stature, :integer
    add_column :users, :figure, :string
    add_column :users, :image_name, :string
    add_column :users, :brother, :string
    add_column :users, :housing, :string
    add_column :users, :birthplace, :string
    add_column :users, :study, :string
    add_column :users, :job, :string
    add_column :users, :money, :string
    
    
    
    
    
  end
end
