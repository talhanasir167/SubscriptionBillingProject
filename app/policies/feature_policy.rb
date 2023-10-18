# frozen_string_literal: true

class FeaturePolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    user.admin?
  end

  def edit?
    update?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def show?
    user.admin? || user.buyer?
  end
end
