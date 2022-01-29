# frozen_string_literal: true

class SearchResult
  attr_accessor :result_list, :total_pages

  def initialize(keyword:, page:)
    @keyword = keyword
    @page = page
    @result_list = []
    @total_pages = 1
  end

  def search
    @result_list = if @keyword.present?
                     Recipe.tasty_search(@keyword).page(valid_page)
                   else
                     Recipe.all.page(1)
                   end
    @total_pages = @result_list.total_pages
  end

  private

  def valid_page
    @page.to_i.to_s == @page ? @page.to_i : 1
  end
end
