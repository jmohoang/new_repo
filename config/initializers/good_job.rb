# frozen_string_literal: true

# Configure GoodJob
GoodJob.configure do |config|
  # Set the Active Record parent class for GoodJob, defaulting to "ApplicationRecord".
  config.active_record_parent_class = 'ApplicationRecord'
end
