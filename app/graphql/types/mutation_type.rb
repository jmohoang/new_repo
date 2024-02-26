# frozen_string_literal: true

module Types
  # MutationType represents the root mutation type for the GraphQL schema.
  class MutationType < Types::BaseObject
    graphql_name 'Mutation'

    field :createUser, mutation: Mutations::CreateUser
  end
end
