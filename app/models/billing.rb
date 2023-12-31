# frozen_string_literal: true

class Billing < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
end
