# frozen_string_literal: true

class UserMailer < ApplicationMailer
  # Sends a welcome email to the user
  def welcome_email(user)
    @user_email = user
    mail(to: @user_email, subject: 'Welcome')
  end
end
