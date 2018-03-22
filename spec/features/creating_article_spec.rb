require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    # visit root page
    visit "/"
    # click link named "New Article"
    click_link "New Article"
    # fill in title and body
    fill_in "Title", with: "Creating a test blog"
    fill_in "Body", with: "This is a test."
    # click button to create the article
    click_button "Create"
    # display "Article has been created"
    expect(page).to have_content("Article has been created")
    # go to articles path
    expect(page.current_path).to eq(articles_path)
  end
end