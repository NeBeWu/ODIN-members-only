class AddProfileDataToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :string, limit: 160
    add_column :users, :location, :string, limit: 30
    add_column :users, :website, :string, limit: 100
    add_column :users, :birth, :date
  end
end
