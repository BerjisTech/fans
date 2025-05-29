class CreateProfiles < ActiveRecord::Migration[8.0]
  def change
    create_table :profiles, id: :uuid do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :display_name
      t.text :about
      t.text :cover_photo_data
      t.boolean :is_creator

      t.timestamps
    end
  end
end
