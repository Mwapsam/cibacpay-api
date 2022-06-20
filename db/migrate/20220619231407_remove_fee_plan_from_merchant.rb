class RemoveFeePlanFromMerchant < ActiveRecord::Migration[7.0]
  def change
    remove_column :merchants, :fee_plan, :string
  end
end
