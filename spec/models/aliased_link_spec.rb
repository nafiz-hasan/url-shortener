# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AliasedLink, type: :model do
  describe 'relationships' do
    it { is_expected.to have_many :infos }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:long_url) }
    it { is_expected.to validate_presence_of(:creator_ip) }
    it { is_expected.to validate_uniqueness_of(:token) }
    it { should allow_value('http://google.com').for(:long_url) }
    it { should_not allow_value('google.ca').for(:long_url) }
    it { should_not allow_value('http://localhost/test').for(:long_url) }
  end
end
