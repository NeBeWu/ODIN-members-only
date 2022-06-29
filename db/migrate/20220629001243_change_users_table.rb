class ChangeUsersTable < ActiveRecord::Migration[7.0]
  change_table :users do |t|
    t.change :username, :string, limit: 16, null: false
    t.string :title, limit: 32
  end
end
