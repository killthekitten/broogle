require "rails_helper"

RSpec.describe "Famous Quotes" do
  describe "Search" do
    let!(:quote) { FamousQuote.create(author: "Some good writer", content: "An excellent phrase about life") }

    before do
      visit root_path
      expect(page).not_to have_text(quote.content)
    end

    it "finds exact matches" do
      search_for "excellent"
      expect(page).to have_text(quote.content)
    end

    it "finds different forms of words" do
      search_for("phrases")
      expect(page).to have_text(quote.content)
    end

    it "finds phrases by separate parts" do
      search_for("excellent life")
      expect(page).to have_text(quote.content)
    end

    it "displays 'nothing found' if nothing was found" do
      search_for("nonsense")
      expect(page).to have_text("Nothing found")
    end
  end

  def search_for(query)
    fill_in :q, with: query
    click_on "Broogle it!"
  end
end

