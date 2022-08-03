class Brand < ApplicationRecord

  has_many :product
  validates :name, uniqueness: { message: 'Already exists' }
  before_save :add_slug

  def add_slug
    self.slug = self.name.parameterize
  end
end
