# app/serializers/user_serializer.rb
class UserSerializer < BaseSerializer
  attributes :id, :name, :email, :role, :manager
end
