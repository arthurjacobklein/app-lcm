class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :reference
      t.integer :quantity
      t.string :gender

      t.timestamps
    end
  end
end
