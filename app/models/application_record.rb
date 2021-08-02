# frozen_string_literal: true

# not implementing anything else here for now
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
