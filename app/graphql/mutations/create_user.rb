# frozen_string_literal: true

module Mutations
  # CreateUser mutation handles the creation of a new user.
  class CreateUser < BaseMutation
    # Define the arguments for the mutation.
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    # Define the fields returned by the mutation.
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    # Resolve method performs the actual creation of the user.
    def resolve(name:, email:, password:)
      user = User.new(name:, email:, password:)

      if user.save
        { user:, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
end
