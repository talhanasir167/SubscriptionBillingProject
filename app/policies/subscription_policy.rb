# frozen_string_literal: true

class SubscriptionPolicy < ApplicationPolicy
  def create?
    user.buyer?
  end

  def show?
    user.buyer?
  end
end
