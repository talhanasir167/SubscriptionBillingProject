# frozen_string_literal: true

class SubscriptionsController < ApplicationController
  before_action :authenticate_user, :set_user, :set_subcriptions, only: %i[create show]

  def create
    subscriptions = Subscription.new(user_id: current_user.id, plan_id: params[:plan_id])
    if subscriptions.save!
      usage(subscriptions)
      redirect_to root_path, notice: 'Subscription created, You have to activate it'
    else
      redirect_to plans_path, notice: 'Subscription Not created'
    end
  end

  def show; end

  private

  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def authenticate_user
    authorize Subscription
  end

  def set_subcriptions
    @subscribed_plans = current_user.plans
    redirect_to root_path, notice: 'No Subscription exits' if @subscribed_plans.nil?
  end

  def usage(subscription)
    plan = subscription.plan
    plan.features.each do |feature|
      UsageFeature.create(subscription_id: subscription.id, feature_id: feature.id, usage: 0)
    end
  end
end
