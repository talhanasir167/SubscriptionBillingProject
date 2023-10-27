# frozen_string_literal: true

class CreateModels < ActiveRecord::Migration[6.0]
  def change
    create_table :models do |t|
      t.string :Reactive

      t.timestamps
    end
  end
end
