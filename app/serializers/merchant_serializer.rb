class MerchantSerializer < ActiveModel::Serializer
  attributes :id, :company, :address_1, :address_2, :city, :state, :postal, :country, :timezone_id, :contact_first_name, :contact_last_name, :contact_phone, :contact_email, :account_number, :routing_number, :username, :fee_plan, :user_id
  has_one :user
end
