# frozen_string_literal: true

class AddExtraUsagePriceToUsageFeature < ActiveRecord::Migration[6.0]
  def change
    add_column :usage_features, :extra_usage_price, :string
  end
end
