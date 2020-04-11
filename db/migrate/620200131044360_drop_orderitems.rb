class DropOrderitems < ActiveRecord::Migration[5.2]
  def change
    drop_table :orderitems
  end
end
