# frozen_string_literal: true

# not using mailers for now
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
