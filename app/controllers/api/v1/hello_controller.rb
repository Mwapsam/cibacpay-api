class Api::V1::HelloController < ApplicationController
  def index
    @message = Message.find(Random.rand(1..5))
    render json: { texts: @message.text }.to_json
  end
end
