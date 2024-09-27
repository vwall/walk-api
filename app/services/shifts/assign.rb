# frozen_string_literal: true

class Shifts::Assign < ApplicationService
  def initialize(walker:, day:)
    @walker = walker
    @day = day
  end

  def call
    shift = Shift.new(walker: @walker, day: @day)

    if shift.save
      send_result(success: true, result: shift)
    else
      send_result(success: false, message: shift.errors.full_messages)
    end
  end
end
