require 'rails_helper'

describe EmailsController, 'testing emails' do

  before(:each) do
    @email = Email.create(Address: 'simon@test.com', EmailType: 'shipment', Event: 'send')
    @new_email_params = {Address: 'barry@test.com', EmailType: 'shipment', Event: 'send'}
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
    expect(Email.last.Address).to eq('barry@test.com')
  end



end
