# frozen_string_literal: true

class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      t.string :plan_name, null: false, index: { unique: true }
      t.integer :monthly_fee, null: false

      t.timestamps
    end
  end
end
