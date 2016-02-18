class HomeController < ApplicationController
  def index
    @collection = FamousQuote.all.page(params[:page]).per(5)
  end
end
