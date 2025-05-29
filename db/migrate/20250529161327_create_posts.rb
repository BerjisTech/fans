class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.text :description
      t.boolean :is_public
      t.boolean :is_paid
      t.decimal :price

      t.timestamps
    end
  end
end
