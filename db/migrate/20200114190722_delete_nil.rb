# frozen_string_literal: true

class DeleteNil < ActiveRecord::Migration[6.0]
  def change
    change_column :cart_items, :cart_id, :bigint, null: true
  end
end
