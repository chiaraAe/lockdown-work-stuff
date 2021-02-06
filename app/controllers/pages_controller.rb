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
        @show_result_sec = 'true'
        @text = "You want #{params[:query]}? We got #{params[:query]}!"
      else
        @show_result_sec = 'none'
        @show_sorry = 'true'
        @sorry = "Sorry, we don't offer #{params[:query]} yet."
      end

    else
      @search_result = {}
      @text = nil
      @show_result_sec = 'none'
    end
  end
end
