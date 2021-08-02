# frozen_string_literal: true

# this table just stores click records for all shortened URLs
class CreateInfos < ActiveRecord::Migration[6.1]
  def change
    create_table :infos do |t|
      t.string :visitor_ip
      t.references :aliased_link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
