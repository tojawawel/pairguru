require "rails_helper"

describe "Top commenters requests", type: :request do
  describe "commenters list" do
    it "displays right content" do
      visit "/top_commenters"
      expect(page).to have_selector("h1", text: "Top commenters of last week")
    end
  end
end
