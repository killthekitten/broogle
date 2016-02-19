class HomeController < ApplicationController
  def index
    @collection = FamousQuote.search(query_string).page(params[:page]).per(3)
  end

  private

  def query_string
    params.fetch(:q, nil)
  end
  helper_method :query_string
end
