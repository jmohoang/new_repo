# frozen_string_literal: true

class GraphqlController < ApplicationController
  def execute
    result = YourSchemaNameHere.execute(params[:query], variables: params[:variables])
    render json: result
  end
end
