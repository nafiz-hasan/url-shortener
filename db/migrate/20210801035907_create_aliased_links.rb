# frozen_string_literal: true

# this table stores the token, original link etc. for shortened URLs
class CreateAliasedLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :aliased_links do |t|
      t.string :long_url
      t.string :token, null: false, limit: 30, index: { unique: true }
      t.string :creator_ip

      t.timestamps
    end
  end
end
