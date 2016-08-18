class EmailsController < ApplicationController

  respond_to :json

  def index
    render json: Email.create_response
  end

  def create
    respond_with Email.create(email_params), status: 200
  end

  def email_params
    params.require(:email).permit(:address, :email_type, :event, :timestamp)
  end

end
