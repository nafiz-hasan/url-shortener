# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Info, type: :model do
  describe 'relationships' do
    it { is_expected.to belong_to :aliased_link }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:visitor_ip) }
  end
end
