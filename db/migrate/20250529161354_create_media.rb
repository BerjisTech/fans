class CreateMedia < ActiveRecord::Migration[8.0]
  def change
    create_table :media, id: :uuid do |t|
      t.references :post, null: false, foreign_key: true, type: :uuid
      t.text :media_data
      t.string :media_type
      t.integer :position

      t.timestamps
    end
  end
end
