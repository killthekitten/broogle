class HomeController < ApplicationController
  def index
    @collection = FamousQuote.search(search_params).page(params[:page]).per(5)
  end

  private

  def search_params
    params.fetch(:q, nil)
  end
end
