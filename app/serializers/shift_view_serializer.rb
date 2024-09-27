class ShiftViewSerializer < BaseSerializer
  attributes attributes :id, :day, :walker_id

  attribute :name_with_email do |resource|
    "#{resource.name}: #{resource.email}"
  end
end
