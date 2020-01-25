class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :categorynumber
      t.string :category
      t.integer :code
      t.string :name, null: false
      t.string :image
      t.integer :price, null: false
      t.integer :taxrate
      t.timestamps
    end
  end
end
