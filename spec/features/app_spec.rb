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
end
