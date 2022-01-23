class SearchesController < ApplicationController
  def index
    json_response(
      search_response
    )
  end

  private

  def search_response
    keyword = permitted_params[:keyword]
    page = permitted_params[:page] || 1
    keyword.present? ? Recipe.tasty_search(keyword).page(page) : {}
  end

  def permitted_params
    params.permit(:keyword, :page).to_h
  end
end
