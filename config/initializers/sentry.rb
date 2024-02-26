# frozen_string_literal: true

Sentry.init do |config|
  config.dsn = ENV.fetch('SENTRY_DSN')

  # Enable Sentry in prod only
  config.enabled_environments = %w[production]

  # Number of background worker threads
  config.background_worker_threads = ENV.fetch('BACKGROUND_WORKER_THREADS', 5).to_i

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = ENV.fetch('SAMPLING_RATE', 1.0).to_f
end
