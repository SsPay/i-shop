# frozen_string_literal: true

class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :comments
  has_many :orders
  has_one :cart, dependent: :destroy
  validate :pass_val
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true,
                       length: { minimum: 8 }
  attr_accessor :password, :password_confirmation
  after_create :send_welcome

  def pass_val
    if password.count('a-z') <= 0 || password.count('A-Z') <= 0
      errors.add(:password, 'must contain 1 small letter, 1 capital letter and minimum 8 symbols')
    end
  end

  def send_welcome
    UserMailer.welcome_email(self).deliver!
  end
end
