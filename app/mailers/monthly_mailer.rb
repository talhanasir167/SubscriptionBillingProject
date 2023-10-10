# frozen_string_literal: true

class MonthlyMailer < ApplicationMailer
  def monthly_mailer
    @user = params[:user]
    @amount = params[:amount]
    @billing = Billing.find_by(user_id: @user.id)
    @greeting = 'Hi... Hope You are fine and save. here is your Subscription Details'

    mail(
      from: Rails.application.credentials[:admin][:mail],
      to: @user.email,
      subject: 'Monthly Subscription Fee'
    )
  end

  def after_payement
    @user = params[:user]
    @greeting = 'Hi... Hope You are fine and save. You have been subscribed'

    mail(
      from: Rails.application.credentials[:admin][:mail],
      to: @user.email,
      subject: 'Monthly Subscription Fee'
    )
  end
end
