# frozen_string_literal: true

class CreateCheckouts < ActiveRecord::Migration[6.0]
  def change
    create_table :checkouts, &:timestamps
  end
end
