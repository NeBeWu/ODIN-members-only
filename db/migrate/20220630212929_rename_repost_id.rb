class RenameRepostId < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :repost_id_id, :repost_id
  end
end
