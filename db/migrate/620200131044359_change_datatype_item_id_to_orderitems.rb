class ChangeDatatypeItemIdToOrderitems < ActiveRecord::Migration[5.2]

  def up
    # 環境ごとにマイグレーションを分ける
    if Rails.env.development? || Rails.env.test?
      change_column :orderitems, :item_id, :integer
    else Rails.env.production?
      # 本番環境はusingオプションを追加
      change_column :orderitems, :item_id, 'integer USING CAST(item_id AS integer)'
    end
  end

  def down
    change_column :orderitems, :item_id, :references
  end
end