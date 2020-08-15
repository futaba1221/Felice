class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :article
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
