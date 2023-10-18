# frozen_string_literal: true

class BillingDayJob < ApplicationJob
  queue_as :default

  def perform(user)
    PaymentMailer.with(user: user).payment_created.deliver_later
    user.subscriptions.delete_all
  end
end
