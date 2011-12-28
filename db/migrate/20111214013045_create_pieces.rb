class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :link
      t.references :user

      t.timestamps
    end
    add_index :pieces, :user_id
  end
end
