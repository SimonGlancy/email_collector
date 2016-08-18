class EmailsController < ApplicationController

  respond_to :json

  def index
    render json: Email.create_response
  end

  def create
      json_params = JSON.parse(request.body.read)
      respond_with Email.create(Address: json_params["Address"],
                                EmailType: json_params["EmailType"],
                                Event: json_params["Event"],
                                Timestamp: json_params["Timestamp"]), status: 200

  end

end
