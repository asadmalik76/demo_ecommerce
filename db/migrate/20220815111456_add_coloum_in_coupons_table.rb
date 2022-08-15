class AddColoumInCouponsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :coupons, :coupon, :string
  end
end
