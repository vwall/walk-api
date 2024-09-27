# frozen_string_literal: true
class BaseSerializer
  include Alba::Resource
  extend AlbaExtension

  transform_keys :lower_camel
end
