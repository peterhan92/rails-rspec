require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user creates a new article" do
    # visit root page
    visit "/"
    # click link named "New Article"
    click_link "Create Article"
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

  scenario "A user fails to create a new article when submitting blanks" do
    visit "/"
    click_link "Create Article"
    fill_in "Title", with: ""
    fill_in "Body", with: ""
    click_button "Create"
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end