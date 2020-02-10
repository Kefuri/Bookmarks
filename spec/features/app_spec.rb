require 'spec_helper'

feature 'testing infrastructure' do
    scenario 'goes to homepage' do
        visit('/')
            expect(page).to have_content("Testing infrastructure working!")
        end
    end
