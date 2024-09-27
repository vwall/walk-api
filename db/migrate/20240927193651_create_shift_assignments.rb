class CreateShiftAssignments < ActiveRecord::Migration[7.2]
  def change
    create_table :shift_assignments, id: :uuid do |t|
      t.integer :status
      t.references :shift, foreign_key: true, type: :uuid
      t.references :dog, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
