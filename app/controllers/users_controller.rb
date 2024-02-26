# frozen_string_literal: true

class UsersController < ApplicationController
  def send_verification_code
    # Generate verification code
    random_number = rand(100_000..999_999)

    verification_code = random_number

    # Send SMS using TwilioService
    twilio_service = TwilioService.new
    twilio_service.send_sms(user.phone_number, "Your verification code is: #{verification_code}")
  end
end
