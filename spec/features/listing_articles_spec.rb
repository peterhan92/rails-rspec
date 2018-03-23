require "rails_helper"

RSpec.feature "Listing Articles" do
  # Create 2+ articles
  before do
    @article1 = Article.create(title: "First Test Article", body: "This is just a test")
    @article2 = Article.create(title: "Second Test Article", body: "This is also just a test")
  end
  scenario "A user gets list of all articles" do
    # list all the articles
    visit "/"
    # expect all the article titles and body to be present
    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end
end