class RemoveTimezoneIdFromMerchant < ActiveRecord::Migration[7.0]
  def change
    remove_column :merchants, :timezone_id, :string
  end
end
