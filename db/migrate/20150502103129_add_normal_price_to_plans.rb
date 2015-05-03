class AddNormalPriceToPlans < ActiveRecord::Migration
  def change
  	add_column :plans, :normal_price, :decimal
  end
end
