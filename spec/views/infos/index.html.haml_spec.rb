# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'infos/index', type: :view do
  before do
    assign(:aliased_link, aliased_link)
    assign(:infos, [info])
  end

  subject { render }

  let!(:aliased_link) { create(:aliased_link) }
  let!(:info) { create(:info, aliased_link: aliased_link) }

  it { is_expected.to have_text info.visitor_ip }
  it { is_expected.to have_text info.created_at }
end
