class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  protected

  #call this authentication method below from your other controllers using:
  # before_filter :authenticate, only: [:show, :index]
  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      #looks in the header of request for the token, will return truthy or falsy/nil
      User.find_by(token: token)
    end
  end
end
