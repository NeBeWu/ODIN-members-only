class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_join_table :posts, :users, table_name: :likes do |t|
      t.index :post_id
      t.index :user_id
      t.timestamps
    end
  end
end
