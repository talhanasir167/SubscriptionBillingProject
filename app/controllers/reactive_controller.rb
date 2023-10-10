# frozen_string_literal: true

class ReactiveController < ApplicationController
  before_action :set_record

  def create
    authorize Reactive
    @session = Stripe::Checkout::Session.create({
                                                  payment_method_types: ['card'],
                                                  line_items: [{
                                                    name: current_user.name,
                                                    amount: @record.total_payement,
                                                    currency: 'usd',
                                                    quantity: 1
                                                  }],
                                                  mode: 'payment',
                                                  success_url: plans_url,
                                                  cancel_url: error_checkout_index_url
                                                })

    session_respond
  end

  def session_respond
    respond_to do |format|
      format.js
    end
  end

  private

  def set_record
    @record = Record.where(user_id: current_user.id).last
  end
end
