class CreateSchedules < ActiveRecord::Migration[7.2]
  def change
    create_table :schedules, id: :uuid do |t|
      t.integer :day, null: false
      t.integer :time_of_day, null: false
      t.references :dog, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
