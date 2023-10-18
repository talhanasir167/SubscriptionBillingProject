# frozen_string_literal: true

class ActivatePolicy < ApplicationPolicy
  def create?
    user.buyer?
  end
end
