class CreateNices < ActiveRecord::Migration[5.0]
  def change
    create_table :nices do |t|
      t.integer :user_id
      t.integer :post_id
      
      t.timestamps
    end
  end
end
