# frozen_string_literal: true

# GraphqlController handles GraphQL queries and authentication.
class GraphqlController < ApplicationController
  before_action :authenticate_user

  # Executes the GraphQL query and returns the result as JSON
  def execute
    result = GraphqlAuthAppSchema.execute(
      params[:query],
      variables: ensure_hash(params[:variables]),
      context: { current_user: @current_user },
      operation_name: params[:operationName]
    )
    render json: result
  end

  private

  # Ensures that the variables are in hash format
  def ensure_hash(variables_string)
    if variables_string.present?
      JSON.parse(variables_string)
    else
      {}
    end
  end
end
