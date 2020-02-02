class RenameCartinitemsColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :cartinitems, :orderitems
  end
end
