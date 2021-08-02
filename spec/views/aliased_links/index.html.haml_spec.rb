# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'aliased_links/index', type: :view do
  before do
    assign(:aliased_links, [aliased_link])
  end

  subject { render }

  let!(:aliased_link) { create(:aliased_link) }

  it { is_expected.to have_text aliased_link.long_url }
  it { is_expected.to have_link  'Metrics', href: metrics_path(aliased_link.token) }
  it { is_expected.to have_link  'Edit', href: edit_aliased_link_path(aliased_link) }
end
