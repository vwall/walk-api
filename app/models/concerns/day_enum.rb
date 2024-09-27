# frozen_string_literal: true

module DayEnum
  extend ActiveSupport::Concern

  included { enum :day, { monday: 0, tuesday: 1, wednesday: 2, thursday: 3, friday: 4 } }
end
