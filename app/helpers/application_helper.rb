# frozen_string_literal: true

# view helper, mostly to show a proper url for the tokens
module ApplicationHelper
  def display_short_url(aliased_link)
    "#{request.host_with_port}/#{aliased_link.token}"
  end
end
