class CreateLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :url
      t.string :shortSlug
      t.integer :clicked, default: 0

      t.timestamps
    end
  end
end
