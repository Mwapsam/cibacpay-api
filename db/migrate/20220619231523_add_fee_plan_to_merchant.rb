class AddFeePlanToMerchant < ActiveRecord::Migration[7.0]
  def change
    add_column :merchants, :fee_plan, :integer
  end
end
