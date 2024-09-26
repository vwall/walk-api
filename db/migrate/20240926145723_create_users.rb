class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users, id: :uuid do |t|
      t.citext :email, null: false, index: { unique: true }
      t.string :name, null: false, limit: 255
      t.integer :role, default: 0
      t.boolean :manager, default: false
      t.string :password_digest, null: false
      t.string :auth_token, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
