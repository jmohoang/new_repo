# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV.fetch('GOOGLE_CLIENT_ID'), ENV.fetch('GOOGLE_CLIENT_SECRET'),
           {
             scope: 'email, profile',
             prompt: 'select_account, consent',
             redirect_uri: '/auth/google/callback'
           }
end
