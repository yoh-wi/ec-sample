class RenameOrderitemsColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :orderitems, :cartinitems
  end
end
