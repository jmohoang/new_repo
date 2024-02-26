# frozen_string_literal: true

module Mutations
  # BaseMutation class serves as the parent class for all mutations in the application.
  # It inherits from GraphQL::Schema::RelayClassicMutation.
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    # Set the argument class for the mutation.
    argument_class Types::BaseArgument

    # Set the field class for the mutation.
    field_class Types::BaseField

    # Set the input object class for the mutation.
    input_object_class Types::BaseInputObject

    # Set the object class for the mutation.
    object_class Types::BaseObject
  end
end
