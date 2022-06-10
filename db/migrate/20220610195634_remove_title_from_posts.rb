class RemoveTitleFromPosts < ActiveRecord::Migration[7.0]
  change_table :posts do |t|
    t.remove :title
    t.rename :body, :content
  end
end
