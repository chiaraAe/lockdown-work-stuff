class PagesController < ApplicationController
  def home
    @items = Item.all
    if params[:query].present?
      sql_query = " \
        title ILIKE :query \
        OR category ILIKE :query \
        OR description ILIKE :query \
      "
      @search_result = Item.where(sql_query, query: "%#{params[:query]}%")
      if @search_result.length >= 1
        @show_result_div = 'true'
        @text = "You want #{params[:query]}? We got #{params[:query]}!"
      else
        @show_result_div = 'none'
        @text = "Sorry, we don't offer #{params[:query]} yet."
      end

    else
      @search_result = {}
      @text = nil
      @show_result_div = 'none'
    end
  end
end
