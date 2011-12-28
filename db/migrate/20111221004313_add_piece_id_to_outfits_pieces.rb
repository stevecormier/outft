class AddPieceIdToOutfitsPieces < ActiveRecord::Migration
  def change
    add_column :outfits_pieces, :piece_id, :integer
    remove_column :outfits_pieces, :part_id
  end
end
