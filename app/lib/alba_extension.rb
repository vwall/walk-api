# frozen_string_literal: true
module AlbaExtension
  # Here attrs are an Array of Symbol
  def formatted_time_attributes(*attrs)
    attrs.each do |attr|
      attribute attr do |object|
        datetime = object.send(attr)
        datetime.nil? ? nil : datetime.utc.iso8601
      end
    end
  end
end
