# frozen_string_literal: true

class BillingsController < ApplicationController
  before_action :autherize_user, :set_bill, :set_sum, :bill_sum, only: %i[show]

  def show
    create_bill
  end

  private

  def set_bill
    @bill = Billing.find_by(user_id: current_user.id)
  end

  def set_sum
    @sum = current_user.plans.sum(&:monthly_fee)
  end

  def bill_sum
    @extra_sum = 0
    subscriptions = current_user.subscriptions.includes(:usage_features)
    subscriptions.each do |subscription|
      subscription.usage_features.each do |usage|
        @extra_sum = (usage.feature.feature_unit_price * usage.usage) + @extra_sum
      end
    end
  end

  def create_bill
    bill_params = { plan_price: @sum, extra_usage_price: @extra_sum, total_amount: @sum + @extra_sum }
    if @bill.nil?
      Billing.create({ user_id: current_user.id }.merge(bill_params))
    else
      @bill.update(bill_params)
    end
  end

  def autherize_user
    authorize Billing
  end
end
