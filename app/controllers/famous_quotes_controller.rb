class FamousQuotesController < ApplicationController
  respond_to :html

  def index
    @collection = FamousQuote.search(query_string).page(params[:page]).per(3)
  end

  def new
    @quote = FamousQuote.new
  end

  def create
    @quote = FamousQuote.create strong_params
    respond_with @quote, location: root_path
  end

  private

  def query_string
    params.fetch(:q, nil)
  end
  helper_method :query_string

  def strong_params
    params.require(:famous_quote).permit(:author, :content)
  end
end
