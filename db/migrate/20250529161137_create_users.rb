class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :username
      t.string :email
      t.string :role
      t.text :bio
      t.text :avatar_data

      t.timestamps
    end
    add_index :users, :email
  end
end
