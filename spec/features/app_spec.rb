require 'spec_helper'

feature 'testing infrastructure' do
  scenario 'is a homepage' do
    visit('/')
    expect(page).to have_content('Greetings')
  end

  scenario 'able to view bookmarks' do
    visit('/')
    visit('/bookmarks')
    expect(page).to have_content("www.google.com")
  end

  scenario 'able to add a bookmark' do
    visit('/bookmarks')
    click_button('Add a bookmark')
    fill_in 'url_field', with: "https://www.bbc.co.uk"
    click_button('Add bookmark')
    expect(page).to have_content("https://www.bbc.co.uk")
  end
end
