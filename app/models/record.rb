# frozen_string_literal: true

class Record < ApplicationRecord
  belongs_to :user

  validates :user, presence: true
end
