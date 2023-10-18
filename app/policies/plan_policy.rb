# frozen_string_literal: true

class PlanPolicy < ApplicationPolicy
  def show?
    user.admin? || user.buyer?
  end

  def index?
    user.admin? || user.buyer?
  end

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
end
