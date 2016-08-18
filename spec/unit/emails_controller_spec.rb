require 'rails_helper'

describe EmailsController, 'testing emails' do

  before(:each) do
    @email = Email.create(address: 'simon@test.com', email_type: 'shipment', event: 'send')
    @new_email_params = {address: 'barry@test.com', email_type: 'shipment', event: 'send'}
    @json_response = {"click_rate" => {"shipment" => 0.0},
                      "emails_clicked" => 0,
                      "emails_opened" => 0,
                      "emails_sent" => 1,
                      "open_rate" => {"shipment" => 0.0}}
  end

  it 'displays existing delivery requests', type: :request do
    get '/'
    json = JSON.parse(response.body)
    expect(json).to eq(@json_response)
  end

  it 'allows a new email to be added', type: :request do
    post '/emails', email:@new_email_params
    expect(Email.last.address).to eq('barry@test.com')
  end



end
