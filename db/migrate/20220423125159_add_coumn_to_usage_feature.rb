# frozen_string_literal: true

class AddCoumnToUsageFeature < ActiveRecord::Migration[6.0]
  def change
    add_column :usage_features, :unit_usage_price, :integer
  end
end
