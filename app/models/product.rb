# frozen_string_literal: true

class Product < ApplicationRecord
  mount_uploaders :images, ProductsImageUploader
  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :category_ids, presence: true
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :comments
  has_many :cart_items, dependent: :destroy
  has_rich_text :description

  extend FriendlyId
  friendly_id :title, use: :slugged

  scope :cheapest, -> { order('price ASC') }
  scope :expensive, -> { order('price DESC') }
  scope :newest, -> { order('created_at DESC') }
  scope :oldest, -> { order('created_at ASC') }
end
