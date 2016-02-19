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

  describe "Submitting Quotes" do
    let(:text) do
      "TV and the Internet are good because they keep stupid people from spending too much time out in public."
    end

    before do
      visit root_path
      click_on "+ Add new quote"
    end

    it "allows to create a quote" do
      fill_in "Author", with: "Douglas Coupland"
      fill_in "Content", with: text
      expect { click_on "Submit Quote" }.to change(FamousQuote, :count)
    end

    it "validates content presence" do
      fill_in "Author", with: "Douglas Coupland"
      fill_in "Content", with: nil
      expect { click_on "Submit Quote" }.not_to change(FamousQuote, :count)
      expect(page).to have_text "can't be blank"
    end

    it "allows empty author" do
      fill_in "Author", with: nil
      fill_in "Content", with: text
      expect { click_on "Submit Quote" }.to change(FamousQuote, :count)
    end

    it "makes new quote searchable right away" do
      fill_in "Content", with: text
      click_on "Submit Quote"

      search_for("tv internet")
      expect(page).to have_text("stupid people")
    end
  end

  def search_for(query)
    fill_in :q, with: query
    click_on "Broogle it!"
  end
end

