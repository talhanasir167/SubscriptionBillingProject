# frozen_string_literal: true

class CreateDashboards < ActiveRecord::Migration[6.0]
  def change
    create_table :dashboards, &:timestamps
  end
end
