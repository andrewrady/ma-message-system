class AddSchoolNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :schoolName, :string
  end
end
