class AddColumnInCouponsTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :coupons, :coupon, :code
    add_column :coupons, :discount, :float
  end
end
