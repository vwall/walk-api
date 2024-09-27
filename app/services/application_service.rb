# frozen_string_literal: true

class ApplicationService
  def self.call(**args)
    new(**args).call
  end

  private

  def self.inherited(subclass)
    subclass.define_method :send_result do |success:, result: nil, message: ''|
      response_hash = { success:, result:, message: }
      Struct.new(*(k = response_hash.keys)).new(*response_hash.values_at(*k))
    end
  end

  def format_response(response)
    JSON.parse(response).deep_transform_keys { |key| key&.underscore&.to_sym }
  end
end
