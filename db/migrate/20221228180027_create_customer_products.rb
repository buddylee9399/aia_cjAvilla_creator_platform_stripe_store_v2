class CreateCustomerProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :customer_products do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :checkout_session_id

      t.timestamps
    end
    # this is validation in case they purchase again, it has a new session
    add_index :customer_products, [:customer_id, :product_id, :checkout_session_id], unique: true, name: 'customer_product_session_index'
  end
end
