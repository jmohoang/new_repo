# frozen_string_literal: true

# ApplicationController serves as the base controller for the application.
class ApplicationController < ActionController::API
  # Authenticates the user based on the provided authorization token
  def authenticate_user
    # Extract the token from the 'Authorization' header
    token = request.headers['Authorization']&.split(' ')&.last

    # Decode the token using the secret key, assuming it's using the HS256 algorithm
    decoded_token = JWT.decode(token, Rails.application.secrets.secret_key_base, true, algorithm: 'HS256')

    # Extract the user ID from the decoded token
    user_id = decoded_token.first['user_id']

    # Find the user based on the extracted user ID
    @current_user = User.find(user_id)
  rescue JWT::DecodeError, ActiveRecord::RecordNotFound
    # Handle any errors that occur during decoding or user lookup
    @current_user = nil
  end
end
