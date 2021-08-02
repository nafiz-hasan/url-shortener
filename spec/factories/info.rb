# frozen_string_literal: true

FactoryBot.define do
  factory :info do
    visitor_ip { '::1' }
    aliased_link
  end
end
