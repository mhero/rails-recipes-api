class SearchesController < ApplicationController
  def index
    json_response(
      search_response
    )
  end

  private

  def search_response
    keyword = permitted_params[:keyword]
    page = valid_page
    keyword.present? ? Recipe.tasty_search(keyword).page(page) : Recipe.all.page(1)
  end

  def permitted_params
    params.permit(:keyword, :page).to_h
  end

  def valid_page
    page = permitted_params[:page] 
    page.to_i.to_s == page ? page.to_i : 1
  end
end
