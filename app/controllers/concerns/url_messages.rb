# frozen_string_literal: true

# storing some useful constants here
module UrlMessages
  MESSAGES = { not_found: 'Short URL not found',
               expired: 'Short URL expired!',
               create_success: 'Short URL successfully created',
               create_fail: 'Failed to create short URL',
               delete_success: 'Successfully deleted URL',
               update_success: 'Successfully updated URL' }.freeze
end
