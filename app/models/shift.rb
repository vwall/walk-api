class Shift < ApplicationRecord
  include DayEnum

  belongs_to :walker, class_name: 'User'

  has_many :shift_assignments
  has_many :dogs, through: :shift_assignments

  validate :walker_duplicate_shift
  validates_inclusion_of :day, in: Shift.days.keys

  private

  def walker_duplicate_shift
    if Shift.exists?(day: day, walker_id: walker_id)
      errors.add(:walker_id, 'already has a shift on this day')
    end
  end
end
