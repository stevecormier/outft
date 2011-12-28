class CreateOutfits < ActiveRecord::Migration
  def change
    create_table :outfits do |t|
      t.string :title
      t.text :description
      t.references :user

      t.timestamps
    end
    add_index :outfits, :user_id
  end
end
