# app/serializers/shift_serializer.rb
class ShiftSerializer < BaseSerializer
  attributes :id, :day, :walker_id

  many :shift_assignments, resource: ShiftAssignmentSerializer
end
