# frozen_string_literal: true

class CreateActivates < ActiveRecord::Migration[6.0]
  def change
    create_table :activates, &:timestamps
  end
end
