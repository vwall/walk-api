# frozen_string_literal: true

class ShiftAssignments::Assign < ApplicationService
  def initialize(dog:, shift:, status:)
    @dog = dog
    @shift = shift
    @status = status
  end

  def call
    shift = ShiftAssignment.new(dog: @dog, shift: @shift, status: @status)

    if shift.save
      send_result(success: true, result: shift)
    else
      send_result(success: false, message: shift.errors.full_messages)
    end
  end
end
