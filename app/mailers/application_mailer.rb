# frozen_string_literal: true

# Application Mailer Module
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'
end
