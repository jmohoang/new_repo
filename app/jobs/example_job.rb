# frozen_string_literal: true

# This is an example Sidekiq job that performs a specific task.
class ExampleJob
  include Sidekiq::Job

  # The perform method is the entry point for the job execution.
  # It receives a name parameter and prints a greeting message.
  #
  # @param name [String] the name to be included in the greeting message
  def perform(name)
    puts "Hello, #{name}!"
  end
end
