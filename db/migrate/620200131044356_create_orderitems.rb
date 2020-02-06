class CreateOrderitems < ActiveRecord::Migration[5.2]
  def change
    create_table :orderitems do |t|
      t.integer :itemcode
      t.string :itemname
      t.integer :itemprice
      t.integer :quantity
      t.references :item, foreign_key: true
      t.references :cart, foreign_key: true
      t.references :order, foreign_key:true 
      t.timestamps
    end
  end
end
