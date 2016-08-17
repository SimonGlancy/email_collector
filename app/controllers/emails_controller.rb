class EmailsController < ApplicationController

  respond_to :json

  def index
    render json: Email.all
  end

  def create
    respond_with Email.create(email_params)
  end

  private

  def email_params
    params.require(:email).permit(:address, :email_type, :event, :timestamp)
  end
end
