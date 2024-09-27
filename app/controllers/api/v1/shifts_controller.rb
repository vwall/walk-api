class Api::V1::ShiftsController < Api::ApplicationController
  def show
    shifts = current_user.shifts.includes(shift_assignments: :dog)

    render json: ShiftSerializer.new(shifts).serialize
  end
end
