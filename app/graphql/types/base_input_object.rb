# frozen_string_literal: true

module Types
  # BaseInputObject represents a base input object type in the GraphQL schema.
  class BaseInputObject < GraphQL::Schema::InputObject
    argument_class Types::BaseArgument
  end
end
