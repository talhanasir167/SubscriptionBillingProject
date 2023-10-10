# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials[:admin][:mail]
  layout 'mailer'
end
