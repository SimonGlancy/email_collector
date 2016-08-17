class EmailsController < ApplicationController

  respond_to :json

  def index
    @data = {emails_sent: Email.find_total_number(Event: "send"),
             emails_opened: Email.find_total_number(Event: "open"),
             emails_clicked: Email.find_total_number(Event: "click"),
             open_rate: Email.create_hash_for("open"),
             click_rate: Email.create_hash_for("click")}

    render json: @data
  end

  def create
    respond_with Email.create(email_params)
  end

  private

  def email_params
    params.require(:email).permit(:Address, :Email_type, :Event, :Timestamp)
  end
end
