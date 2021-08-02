# frozen_string_literal: true

# basic validations and model setup for url shortener
class AliasedLink < ApplicationRecord
  has_many :infos, dependent: :destroy

  validates :long_url, presence: true
  validates :creator_ip, presence: true

  validates :token, uniqueness: true

  # Just using a super simple URL validator for now
  validates :long_url, format: URI::DEFAULT_PARSER.make_regexp(%w[http https])

  validate :long_url_banned

  before_create :generate_token

  attr_accessor :custom_token

  DEFAULT_LINK_VALIDITY = 6.months.freeze

  # just retrieving the links which are not expired
  scope :unexpired, -> { where('created_at > ?', DEFAULT_LINK_VALIDITY.ago) }

  # we can add more banned domains in this hash as we find necessary
  BANNED_HOSTS = ['localhost'].freeze

  def link_expired?
    (Time.current - created_at) > DEFAULT_LINK_VALIDITY
  end

  def long_url_banned
    return if long_url.blank?

    errors.add(:long_url, 'Cannot shorten URLs from this domain') if BANNED_HOSTS.include?(URI.parse(long_url).host)
  end

  private

  # Other than custom tokens, we can generate 16^6 unique tokens (token contains characters: 0-9, a-f)
  def generate_token
    self.token = custom_token.presence || SecureRandom.hex(3)
    self.custom_token = nil
    generate_token if AliasedLink.exists?(token: token)
  end
end
