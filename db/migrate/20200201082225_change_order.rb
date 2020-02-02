class ChangeOrder < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :orderitems, :string
  end
end
