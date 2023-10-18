# frozen_string_literal: true

class BillingPolicy < ApplicationPolicy
  def show?
    user.buyer?
  end
end
