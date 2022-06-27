class AddLimitToContent < ActiveRecord::Migration[7.0]
  change_table :posts do |t|
    t.change :content, :string, limit: 300
  end
end
