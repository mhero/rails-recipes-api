# frozen_string_literal: true

class SearchResult
  attr_accessor :result_list, :total_pages

  def initialize(keyword:, page:)
    @keyword = keyword
    @page = page
  end

  def search
    if @keyword.present?
      Recipe.tasty_search(@keyword).page(valid_page).includes(:ingredients)
    else
      Recipe.all.page(1).includes(:ingredients)
    end
  end

  private

  def valid_page
    @page.to_i.to_s == @page ? @page.to_i : 1
  end
end
