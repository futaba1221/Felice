class CreateFootprints < ActiveRecord::Migration[5.0]
  def change
    create_table :footprints do |t|
        t.string :visiter_id
        t.string :visited_id
      t.timestamps
    end
    add_index :footprints, :visiter_id
    add_index :footprints, :visited_id
  end
end
