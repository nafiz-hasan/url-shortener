# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Create Link', type: :feature do
  scenario 'Create a new URL' do
    visit root_path
    click_link 'Create a short URL'
    fill_in 'Long url', with: 'http://www.google.com'
    fill_in 'Custom token', with: 'test123'
    click_button 'Create Aliased link'
    expect(page).to have_text 'Short URL successfully created'
  end
end
