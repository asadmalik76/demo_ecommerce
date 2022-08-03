class Product < ApplicationRecord


  enum status: %i[Available OutofStock Draft]

  belongs_to :category
  belongs_to :brand

  validates :description, length: { minimum: 50, message: ' must be greater than 50 characters' }

  before_save :add_slug
  after_create :add_sku


  def add_sku
    self.sku = 4.times.map { rand(65..90).chr }.join.to_s + 8.times.map { rand(0..10) }.join.to_s
  end

  def add_slug
    self.slug = self.name.parameterize + self.id.to_s
  end

end
