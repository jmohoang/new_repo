# frozen_string_literal: true

# Configure Sidekiq for the server environment
Sidekiq.configure_server do |config|
  # Set the Redis URL for the server based on the environment variable, defaulting to localhost
  config.redis = { url: ENV.fetch('SIDEKIQ_REDIS_URL', 'redis://localhost:6379') }

  # Set the concurrency option for the server based on the environment variable, defaulting to 10
  config.options[:concurrency] = ENV.fetch('SIDEKIQ_CONCURRENCY', 10).to_i
end

# Configure Sidekiq for the client environment
Sidekiq.configure_client do |config|
  # Set the Redis URL for the client based on the environment variable, defaulting to localhost
  config.redis = { url: ENV.fetch('SIDEKIQ_REDIS_URL', 'redis://localhost:6379') }
end
