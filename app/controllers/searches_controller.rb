# frozen_string_literal: true

class SearchesController < ApplicationController
  def index
    json_response(
      Recipe.tasty_search(permitted_params[:keyword])
    )
  end

  private

  def permitted_params
    params.permit(:keyword).to_h
  end
end
