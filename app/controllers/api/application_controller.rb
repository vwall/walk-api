# frozen_string_literal: true
class Api::ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  include ActionController::HttpAuthentication::Token::ControllerMethods

  require 'active_support/core_ext'

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActionController::RoutingError, with: :not_implemented

  before_action :authenticate_request!

  private

  def authenticate_request!
    render_unauthorized unless current_user
  end

  def current_user
    @current_user ||=
      begin
        authenticate_with_http_token { |token, options| User.find_by(auth_token: token) }
      end
  end
  def render_unauthorized(realm = 'Application')
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Unauthorized. Access denied', status: :unauthorized
  end
end
