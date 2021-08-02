# frozen_string_literal: true

FactoryBot.define do
  factory :aliased_link do
    long_url { 'https://www.google.com' }
    token { 'test123' }
    creator_ip { '::1' }
  end
end
