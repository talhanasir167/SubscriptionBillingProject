# frozen_string_literal: true

class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :feature_name, null: false, index: { unique: true }
      t.string :feature_code, index: { unique: true }
      t.integer :feature_unit_price, null: false
      t.integer :feature_max_unit_limit, null: false
      t.belongs_to :plan
      t.timestamps
    end
  end
end
