class RenameRefMerchants < ActiveRecord::Migration[7.0]
  def change
    rename_column :merchants, :external_identifier, :fee_plan
  end
end
