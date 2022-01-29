class SearchesController < ApplicationController
  def index
    json_response(
      search_response
    )
  end

  private

  def search_response
    search_result = SearchResult.new(
      keyword: permitted_params[:keyword],
      page: permitted_params[:page]
    )
    search_result.search
    search_result
  end

  def permitted_params
    params.permit(:keyword, :page).to_h
  end
end
