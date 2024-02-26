# frozen_string_literal: true

module Mutations
  # SignInUser mutation handles the authentication and sign-in process for a user.
  class SignInUser < BaseMutation
    # Define the arguments for the mutation.
    argument :email, String, required: true
    argument :password, String, required: true

    # Define the fields returned by the mutation.
    field :token, String, null: true
    field :user, Types::UserType, null: true
    field :errors, [String], null: false

    # Resolve method performs the authentication and sign-in process.
    def resolve(email:, password:)
      user = User.find_by(email:)

      if user&.authenticate(password)
        token = issue_token(user)
        { token:, user:, errors: [] }
      else
        { token: nil, user: nil, errors: ['Invalid email or password'] }
      end
    end

    private

    # Issue a token for the authenticated user.
    def issue_token(user)
      payload = { user_id: user.id }
      JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS256')
    end
  end
end
