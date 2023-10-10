# frozen_string_literal: true

class BillMailer < ApplicationMailer
  def bill_mailer
    @user = params[:user]
    @sum = params[:amount]

    @greeting = 'Hi Hope you are Fine'

    mail(
      from: Rails.application.credentials[:admin][:mail],
      to: @user.email,
      subject: 'First Subscription '
    )
  end
end
