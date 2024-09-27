class ShiftAssignment < ApplicationRecord
  enum :status, { home_waiting: 0, transit_park: 1, at_field: 2, transit_home: 3, home_safe: 4 }

  belongs_to :dog
  belongs_to :shift

  validates :shift, uniqueness: { scope: %i[dog_id] }
  validates_inclusion_of :status, in: ShiftAssignment.statuses.keys
end
