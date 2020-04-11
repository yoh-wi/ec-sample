class ChangeDataItemIdToOrderitems < ActiveRecord::Migration[5.2]
  def change
    change_column :orderitems, :item_id, :integer
  end
end
