# frozen_string_literal: true

class Schedules::Assign < ApplicationService
  def initialize(dog:, time_of_day:, day:)
    @dog = dog
    @time_of_day = time_of_day
    @day = day
  end

  def call
    schedule = Schedule.new(dog: @dog, time_of_day: @time_of_day, day: @day)

    if schedule.save
      send_result(success: true, result: schedule)
    else
      send_result(success: false, message: schedule.errors.full_messages)
    end
  end
end
