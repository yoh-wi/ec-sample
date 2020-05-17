class AddpriceSumToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :priceSum, :integer
  end
end
