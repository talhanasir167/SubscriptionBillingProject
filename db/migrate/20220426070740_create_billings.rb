# frozen_string_literal: true

class CreateBillings < ActiveRecord::Migration[6.0]
  def change
    create_table :billings do |t|
      t.integer :plan_price
      t.integer :extra_usage_price
      t.integer :total_amount
      t.belongs_to :user

      t.timestamps
    end
  end
end
