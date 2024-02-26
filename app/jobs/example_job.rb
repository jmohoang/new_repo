# frozen_string_literal: true

# Job class for performing an example task
class ExampleJob < ApplicationJob
  def perform(name)
    puts "Hello, #{name}!"
  end
end
