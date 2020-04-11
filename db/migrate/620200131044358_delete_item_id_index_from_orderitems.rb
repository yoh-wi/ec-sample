class DeleteItemIdIndexFromOrderitems < ActiveRecord::Migration[5.2]
  def change
    remove_index :orderitems, :item_id
  end
end
