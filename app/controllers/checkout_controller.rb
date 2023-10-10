# frozen_string_literal: true

class CheckoutController < ApplicationController
  def create
    billing = Billing.find_by(id: params[:id])
    authorize Checkout
    before_payement(billing)
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: current_user.name,
                                                    amount: billing.total_amount,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: success_checkout_index_url,
                                                  cancel_url: error_checkout_index_url
                                                })

    session_respond
  end

  def session_respond
    respond_to do |format|
      format.js
    end
  end

  def before_payement(billing)
    MonthlyMailer.with(user: current_user, amount: billing.total_amount).monthly_mailer.deliver_now
  end
end
