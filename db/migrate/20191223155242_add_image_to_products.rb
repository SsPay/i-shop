# frozen_string_literal: true

class AddImageToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :images, :string, array: true, default: []
  end
end
