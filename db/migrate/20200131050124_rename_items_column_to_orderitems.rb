class RenameItemsColumnToOrderitems < ActiveRecord::Migration[5.2]
  def change
    rename_column :orderitems, :items_id, :item_id
    rename_column :orderitems, :carts_id, :cart_id
    rename_column :orderitems, :orders_id, :order_id
  end
end
