class RenameOrderitemColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders, :orderitem_id, :orderitems
  end
end
