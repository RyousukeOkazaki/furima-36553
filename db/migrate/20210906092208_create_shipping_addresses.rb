class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :tel          , null: false
      t.string  :postal_code  , null: false
      t.string  :city         , null: false
      t.string  :street       , null: false
      t.string  :building     , null: false
      t.integer :prefecture_id, null: false
      t.references :user      , null: false, foreign_key: true

      t.timestamps
    end
  end
end
