class Api::V1::SchedulesController < Api::ApplicationController
  def index
    render json: ScheduleSerializer.new(Schedule.all).serialize
  end
end
