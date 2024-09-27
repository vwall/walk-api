class Api::V1::AuthsController < Api::ApplicationController
  skip_before_action :authenticate_request!, only: [:create]

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      user.regenerate_auth_token

      response.set_header('Authorization', "Token token=#{user.auth_token}")

      head :ok
    else
      render json: { error: 'Invalid login' }, status: :unauthorized
    end
  end
end
