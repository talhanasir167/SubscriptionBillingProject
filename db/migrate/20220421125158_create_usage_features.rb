# frozen_string_literal: true

class CreateUsageFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :usage_features do |t|
      t.references :subscription, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true
      t.integer :usage

      t.timestamps
    end
  end
end
