class AddImageRemoteUrlToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :image_remote_url, :string

  end
end
