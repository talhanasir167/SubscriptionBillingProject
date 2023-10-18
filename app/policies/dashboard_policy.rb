# frozen_string_literal: true

class DashboardPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || user.buyer?
  end
end
