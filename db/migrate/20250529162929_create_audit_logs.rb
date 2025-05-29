class CreateAuditLogs < ActiveRecord::Migration[8.0]
  def change
    create_table :audit_logs, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :action
      t.string :record_type
      t.integer :record_id
      t.text :payload

      t.timestamps
    end
  end
end
