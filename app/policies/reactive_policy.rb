# frozen_string_literal: true

class ReactivePolicy < ApplicationPolicy
  def create?
    user.buyer?
  end
end
