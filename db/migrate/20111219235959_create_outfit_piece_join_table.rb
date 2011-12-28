class CreateOutfitPieceJoinTable < ActiveRecord::Migration
  def change
    create_table :outfits_pieces, :id => false do |t|
      t.integer :outfit_id
      t.integer :piece_id
    end
  end
end
