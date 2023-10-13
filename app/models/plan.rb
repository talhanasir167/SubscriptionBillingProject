# frozen_string_literal: true

class Plan < ApplicationRecord
  has_many :features, dependent: :destroy

  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :monthly_fee, :plan_name, presence: true
  validates :plan_name, uniqueness: true
  validates :monthly_fee, numericality: { message: 'It seems wrong, it must be in integer' }
end
