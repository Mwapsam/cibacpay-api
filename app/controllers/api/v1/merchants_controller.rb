require 'uri'
require 'json'
require 'net/http'

class Api::V1::MerchantsController < ApplicationController
  def create
    merchants = Merchant.new(merchants_params)
    data = {
      company: merchants.company,
      address_1: merchants.address_1,
      address_2: merchants.address_2,
      city: merchants.city,
      state: merchants.state,
      postal: merchants.postal,
      country: merchants.country,
      timezone_id: merchants.timezone_id,
      contact_first_name: merchants.contact_first_name,
      contact_last_name: merchants.contact_last_name,
      contact_phone: merchants.contact_phone,
      contact_email: merchants.contact_email,
      account_number: merchants.account_number,
      routing_number: merchants.routing_number,
      username: merchants.username,
      fee_plan: merchants.fee_plan
    }

    if merchants.save
      url = URI('https://sibacpay.transactiongateway.com/api/v3/affiliate/gateways')
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true

      request = Net::HTTP::Post.new(url)
      request['Authorization'] = ENV.fetch('API_KEY', nil)
      request['Content-Type'] = 'application/json'

      request.body = JSON.dump(data)
      response = https.request(request)
      render json: response.read_body, status: 200
    else
      render json: { error: merchants.errors.full_messages }, status: 422
    end
  end

  private

  def merchants_params
    params.require(:merchant).permit(:company, :address_1, :address_2, :city, :state, :postal, :country, :timezone_id, :contact_first_name, :contact_last_name,
                                     :contact_phone, :contact_email, :account_number, :routing_number, :username, :fee_plan, :user_id)
  end
end
