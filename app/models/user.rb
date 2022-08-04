# frozen_string_literal: true

# USer Active Record
class User < ApplicationRecord
  has_many :products
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
