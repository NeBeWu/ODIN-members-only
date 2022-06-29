class AddParentToPosts < ActiveRecord::Migration[7.0]
  change_table :posts do |t|
    t.references :parent, foreign_key: { to_table: :posts }
  end
end
