# frozen_string_literal: true

class Subscription < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :plan

  validates :user, presence: true
  validates :plan, presence: true

  has_many :usage_features, dependent: :destroy
  has_many :features, through: :usage_features
end
