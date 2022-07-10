class RenameRepostIdToSourceId < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :repost_id, :source_id
  end
end
