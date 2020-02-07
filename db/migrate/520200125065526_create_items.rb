class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :code, null: false, unique: true
      t.string :name, null: false
      t.string :image
      t.integer :price, null: false
      t.integer :taxrate
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
