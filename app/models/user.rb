# frozen_string_literal: true

# USer Active Record
class User < ApplicationRecord
  has_many :products
  has_one_attached :avatar
  has_one :cart
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
