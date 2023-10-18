# frozen_string_literal: true

class RecordPolicy < ApplicationPolicy
  def show?
    user.buyer?
  end

  def index?
    user.admin?
  end
end
