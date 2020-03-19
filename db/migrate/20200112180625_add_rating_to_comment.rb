# frozen_string_literal: true

class AddRatingToComment < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :rating, :integer
  end
end
