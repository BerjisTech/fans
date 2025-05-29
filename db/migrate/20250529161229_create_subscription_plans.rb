class CreateSubscriptionPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :subscription_plans, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.text :description
      t.decimal :price
      t.string :billing_frequency
      t.boolean :is_active

      t.timestamps
    end
  end
end
