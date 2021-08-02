# frozen_string_literal: true

namespace :sample_data do
  desc 'create some sample short URLs'

  # create some sample links
  task create_sample_urls: :environment do
    aliased_urls = [
      {
        long_url: 'https://www.espncricinfo.com/',
        custom_token: 'cric',
        creator_ip: '::1'
      },
      {
        long_url: 'https://getbootstrap.com/docs/4.4/getting-started/introduction/',
        creator_ip: '::1'
      },
      {
        long_url: 'https://www.discourse.org/',
        creator_ip: '::1'
      },
      {
        long_url: 'https://www.apple.com/ca/',
        creator_ip: '::1'
      }
    ]

    AliasedLink.create(aliased_urls)
    puts 'Sample links created'
  end
end
