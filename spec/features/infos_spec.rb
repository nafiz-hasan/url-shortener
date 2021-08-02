# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'View Summary', type: :feature do
  let!(:aliased_link) { create(:aliased_link) }
  let!(:info) { create(:info, aliased_link: aliased_link) }

  scenario 'View total counts' do
    visit metrics_path(aliased_link.token)
    expect(page).to have_text 'Total visits: 1'
  end
end
