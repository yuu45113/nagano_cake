class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      
      t.integer  :customer_id
      t.string   :name
      t.string   :address
      t.string   :postal_code
      t.integer  :postage
      t.integer  :amounts_billed
      t.integer  :payment_method
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
