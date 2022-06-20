class RenameUserColumnMerchants < ActiveRecord::Migration[7.0]
  def change
    rename_column :merchants, :users_id, :user_id
  end
end
