class Api::V1::ProfilesController < Api::ApplicationController
  def show
    render json: UserSerializer.new(current_user).serialize
  end
end
