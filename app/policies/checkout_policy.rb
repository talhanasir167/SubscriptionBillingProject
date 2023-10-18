# frozen_string_literal: true

class CheckoutPolicy < ApplicationPolicy
  def create?
    user.buyer?
  end
end
