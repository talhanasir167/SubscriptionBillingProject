# frozen_string_literal: true

class PaymentMailer < ApplicationMailer
  def payment_created
    @user = params[:user]
    @bill = Billing.find_by(user_id: @user.id)
    @greeting = 'Hi Kindly Subscribe Your Subscription'

    mail(
      from: Rails.application.credentials[:admin][:mail],
      to: @user.email,
      subject: 'Activate Your Monthly Subscription by clicking on the following link or go to the app'
    )
  end
end
