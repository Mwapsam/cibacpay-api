class RenameColumnMerchants < ActiveRecord::Migration[7.0]
  def change
    rename_column :merchants, :contact_first_nam, :contact_first_name
  end
end
