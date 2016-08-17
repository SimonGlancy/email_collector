require 'rails_helper'

describe EmailsController, 'testing emails' do

  before(:each) do
    @email = Email.create(address: 'simon@test.com', email_type: 'shipment', event: 'send')
    @new_email_params = {address: 'barry@test.com', email_type: 'shipment', event: 'send'}
  end

  it 'displays existing delivery requests', type: :request do
    get '/'
    json = JSON.parse(response.body)
    expect(json[0]["address"]).to eq(@email.address)
  end

  it 'allows a new email to be added', type: :request do
    post '/emails.json', email:@new_email_params
    json = JSON.parse(response.body)
    expect(Email.last.address).to eq('barry@test.com')
  end



end
