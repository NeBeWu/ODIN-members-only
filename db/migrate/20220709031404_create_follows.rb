class CreateFollows < ActiveRecord::Migration[7.0]
  def change
    create_table :follows, force: true, id: false do |t|
      t.integer :followee_id, null: false
      t.integer :follower_id, null: false
    end

    add_index :follows, :followee_id
    add_index :follows, :follower_id
  end
end
