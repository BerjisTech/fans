class CreatePayments < ActiveRecord::Migration[8.0]
  def change
    create_table :payments, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.decimal :amount
      t.string :payment_method
      t.string :status
      t.string :transaction_id

      t.timestamps
    end
  end
end
