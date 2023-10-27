# frozen_string_literal: true

class CreateRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :records do |t|
      t.integer :total_payement
      t.belongs_to :user

      t.timestamps
    end
  end
end
