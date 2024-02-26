# frozen_string_literal: true

module Types
  # QueryType represents the root query type for the GraphQL schema.
  class QueryType < Types::BaseObject
    field :me, Types::UserType, null: true, description: 'Fetch the current user'

    # Resolves the `me` field
    def me
      context[:current_user]
    end
  end
end
