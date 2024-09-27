class Schedule < ApplicationRecord
  include DayEnum

  enum :time_of_day, { morning: 0, afternoon: 1, all_day: 2 }

  belongs_to :dog

  validate :dog_duplicate_schedule
  validates_inclusion_of :day, in: Schedule.days.keys

  private

  def dog_duplicate_schedule
    errors.add(:dog_id, 'already has a shift on this day') if Schedule.exists?(day: day, dog_id: dog_id)
  end
end
