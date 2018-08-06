class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :bank_ifsc_code
      t.integer :bank_account_number
      t.float :amount
      t.string :merchant_transaction_ref
      t.date :transaction_date
      t.string :payment_gateway_merchant_reference

      t.timestamps
    end
  end
end
