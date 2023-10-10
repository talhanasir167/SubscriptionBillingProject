# frozen_string_literal: true

class ActivateController < ApplicationController
  before_action :autherize_user, :set_sum, :monthly_payement, only: %i[create]

  def create
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: current_user.name,
                                                    amount: @sum,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: success_checkout_index_url,
                                                  cancel_url: error_checkout_index_url
                                                })

    session_respond
  end

  private

  def session_respond
    respond_to do |format|
      format.js
    end
  end

  def set_sum
    @sum = current_user.plans.sum(&:monthly_fee)
  end

  def autherize_user
    authorize Activate
  end

  def monthly_payement
    BillMailer.with(user: current_user, amount: @sum).bill_mailer.deliver_now
  end
end
