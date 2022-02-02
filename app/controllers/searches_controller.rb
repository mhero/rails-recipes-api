# frozen_string_literal: true

class SearchesController < ApplicationController
  def index
    render json: serialized_response(search_response)
  end

  private

  def search_response
    search_response = SearchResult.new(
      keyword: permitted_params[:keyword],
      page: permitted_params[:page]
    )
    search_response.search
  end

  def serialized_response(response)
    options = {}
    options[:include] = %i[ingredients ingredients.description]
    options[:meta] = { total: response.total_pages }

    RecipeSerializer.new(
      response,
      options
    ).serialized_json
  end

  def permitted_params
    params.permit(:keyword, :page).to_h
  end
end
