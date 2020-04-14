class AddFirstAndLastNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :approved, :boolean, default: false
  end
end
