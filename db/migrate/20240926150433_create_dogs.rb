class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs, id: :uuid do |t|
      t.string :name, null: false, limit: 255
      t.integer :status, default: 0
      t.references :owner, foreign_key: { to_table: :users }, type: :uuid, index: true

      t.timestamps
    end
  end
end
