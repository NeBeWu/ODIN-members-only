class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :title, null: false, limit: 300
      t.text :body, null: false

      t.timestamps
    end
  end
end
