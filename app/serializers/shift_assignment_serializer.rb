class ShiftAssignmentSerializer < BaseSerializer
  attributes :id, :status, :dog_id, :shift_id

  one :dog, resource: DogSerializer
end
