# frozen_string_literal: true

module Types
  # BaseUnion represents a base union type in the GraphQL schema.
  class BaseUnion < GraphQL::Schema::Union
    edge_type_class(Types::BaseEdge)
    connection_type_class(Types::BaseConnection)
  end
end
