# frozen_string_literal: true

module Types
  # BaseField represents a base field in the GraphQL schema.
  class BaseField < GraphQL::Schema::Field
    argument_class Types::BaseArgument
  end
end
