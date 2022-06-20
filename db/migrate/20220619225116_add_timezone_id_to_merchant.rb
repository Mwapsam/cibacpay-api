class AddTimezoneIdToMerchant < ActiveRecord::Migration[7.0]
  def change
    add_column :merchants, :timezone_id, :integer
  end
end
