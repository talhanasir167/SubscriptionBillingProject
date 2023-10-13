# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: { buyer: 0, admin: 1 }
  after_initialize :set_default_role, if: :new_record?

  has_many :subscriptions, dependent: :destroy
  has_many :plans, through: :subscriptions

  has_many :billings, dependent: :destroy
  has_many :records, dependent: :destroy

  def set_default_role
    self.role ||= :buyer
  end
 
  has_one_attached :avatar
end
