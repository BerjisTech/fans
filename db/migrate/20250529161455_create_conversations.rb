class CreateConversations < ActiveRecord::Migration[8.0]
  def change
    create_table :conversations, id: :uuid do |t|
      t.references :sender, null: false, foreign_key: true, type: :uuid
      t.references :recipient, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
