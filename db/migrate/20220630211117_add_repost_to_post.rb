class AddRepostToPost < ActiveRecord::Migration[7.0]
  change_table :posts do |t|
    t.references :repost_id, foreign_key: { to_table: :posts }
  end

  def change
    change_column_null(:posts, :content, true)
  end
end
