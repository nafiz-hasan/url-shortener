# frozen_string_literal: true

# model to store url visit records
class Info < ApplicationRecord
  belongs_to :aliased_link

  validates :visitor_ip, presence: true
end
