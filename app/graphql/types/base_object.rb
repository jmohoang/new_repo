# frozen_string_literal: true

module Types
  # BaseObject represents a base object type in the GraphQL schema.
  class BaseObject < GraphQL::Schema::Object
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
    field_class Types::BaseField
  end
end
