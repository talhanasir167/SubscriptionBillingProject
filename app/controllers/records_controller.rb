# frozen_string_literal: true

class RecordsController < ApplicationController
  before_action :authorize_user, only: %i[show index]

  def show
    @record = Record.where(user_id: current_user.id)
    create_record
  end

  def index
    @user = User.all
  end

  private

  def create_record
    recover_subscriptions
    @bill = Billing.find_by(user_id: current_user.id)
    Record.create(user_id: current_user.id, total_payement: @bill.total_amount)
    MonthlyMailer.with(user: current_user).after_payement.deliver_now
  end

  def recover_subscriptions
    subscriptions = current_user.subscriptions.with_deleted
    subscriptions.each do |subscription|
      subscription.with_deleted.find_by(id: subscription.id).recover
    end
  end

  def authorize_user
    authorize Record
  end
end
