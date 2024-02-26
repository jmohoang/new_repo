# frozen_string_literal: true

require 'twilio-ruby'

class TwilioService
  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_sms(to, body)
    message = @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to:,
      body:
    )

    # Check if the message was successfully sent
    return true if message.status == 'sent'

    false
  rescue Twilio::REST::TwilioError => e
    # Handle any Twilio API errors
    puts "Twilio API Error: #{e.message}"
    false
  end
end
