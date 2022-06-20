class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :company
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :postal
      t.string :country
      t.string :timezone_id
      t.string :contact_first_nam
      t.string :contact_last_name
      t.string :contact_phone
      t.string :contact_email
      t.string :account_number
      t.string :routing_number
      t.string :username
      t.string :external_identifier
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
