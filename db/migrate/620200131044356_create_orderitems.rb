class CreateOrderitems < ActiveRecord::Migration[5.2]
  def change
    create_table :orderitems do |t|
      t.string :itemcode
      t.string :itemname
      t.integer :itemprice
      t.integer :quantity
      t.references :item, foreign_key: true
      t.integer :cart_id
      t.references :order, foreign_key:true 
      t.timestamps
    end
  end
end
