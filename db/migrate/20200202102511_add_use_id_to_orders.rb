class AddUseIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_id, :integer, foreign_key: true
  end
end
