# frozen_string_literal: true

class UsageFeaturePolicy < ApplicationPolicy
  def edit?
    update?
  end

  def update?
    user.buyer?
  end

  def show?
    user.buyer?
  end

  def index?
    user.buyer? || user.admin?
  end
end
