# frozen_string_literal: true

# SessionsController handles authentication and session management.
class SessionsController < ApplicationController
  def create_from_oauth(auth)
    user = User.from_omniauth(auth)
    if user
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Logged in successfully.'
    else
      redirect_to root_path, alert: 'Failed to authenticate with the provider.'
    end
  end
end
