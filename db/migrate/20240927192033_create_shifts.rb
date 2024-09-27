class CreateShifts < ActiveRecord::Migration[7.2]
  def change
    create_table :shifts, id: :uuid do |t|
      t.integer :day
      t.references :walker, foreign_key: { to_table: :users }, type: :uuid, index: true

      t.timestamps
    end
  end
end
