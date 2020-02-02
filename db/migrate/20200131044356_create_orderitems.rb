class CreateOrderitems < ActiveRecord::Migration[5.2]
  def change
    create_table :orderitems do |t|
      t.integer :itemcatecode
      t.string :itemcatename
      t.integer :itemcode
      t.string :itemname
      t.integer :itemprice
      t.integer :quantity
      t.references :items, foreign_key: true
      t.references :carts, foreign_key: true
      t.references :orders, foreign_key:true 
      t.timestamps
    end
  end
end
