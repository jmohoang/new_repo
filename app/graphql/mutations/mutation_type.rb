# frozen_string_literal: true

module Types
  # MutationType defines the mutations available in the GraphQL schema.
  class MutationType < Types::BaseObject
    # Define the mutation for creating a user.
    field :create_user, mutation: Mutations::CreateUser

    # Define the mutation for signing in a user.
    field :sign_in_user, mutation: Mutations::SignInUser
  end
end
