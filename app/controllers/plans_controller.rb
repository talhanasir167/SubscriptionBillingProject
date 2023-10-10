# frozen_string_literal: true

class PlansController < ApplicationController
  before_action :check_status
  before_action :authenticate_user!
  before_action :set_plan, only: %i[show edit update destroy]
  before_action :authorize_obj, only: %i[create edit update destroy]
  before_action :authorize_user, only: %i[index show]

  def index
    @plan = Plan.all
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan.create(plan_params)
    if @plan.errors.any?
      redirect_to plans_path, alert: @plan.errors.full_messages
    else
      redirect_to plans_path, notice: 'Plan Created Successfully'
    end
  end

  def show; end

  def edit; end

  def update
    if @plan.update(plan_params)
      redirect_to plan_url(@plan), notice: 'Plan successfully updated.'
    else
      redirect_to plan_url(@plan), notice: 'Plan not updated'
    end
  end

  def destroy
    if @plan.destroy
      redirect_to plans_path, notice: 'Plan Deleted'
    else
      redirect_to dashboards, alert: 'Plan not Deleted'
    end
  end

  private

  def sub_mailer
    @sum = current_user.plans.sum(&:monthly_fee)
    BillMailer.with(user: current_user, sum: @sum).bill_mailer.deliver_later
    redirect_to root_path
  end

  def authorize_obj
    authorize @plan
  end

  def authorize_user
    authorize Plan
  end

  def set_plan
    @plan = Plan.find_by(id: params[:id])
  end

  def plan_params
    params.require(:plan).permit(:plan_name, :monthly_fee)
  end

  def check_status
    @record = Record.where(user_id: User.last.id).last
    resubscribe if @record.updated_at.to_i - Time.zone.now.to_i > 30
  end

  def resubscribe
    @bill = Billing.find_by(user_id: current_user.id)
    flash[:alert] = 'Pay your Fee'
    BillingDayJob.perform_later(current_user)
  end
end
