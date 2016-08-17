require 'rails_helper'

describe Email, 'testing emails' do

  before(:each) do
    @email1 = Email.create("address":"barney@lostmy.name","email_type":"Shipment","event":"send","timestamp":1432820696)
    @email2 = Email.create("address":"tom@lostmy.name","email_type":"UserConfirmation","event":"click","timestamp":1432820702)
    @email3 = Email.create("address":"vitor@lostmy.name","email_type":"Shipment","event":"open","timestamp":1432820704)
  end

  describe "#sent" do
    it "returns the number of sent emails" do

      expect(Email.sent).to eq(1)
    end
  end

  describe "#opened" do
    it "returns the number of opened emails" do

      expect(Email.opened).to eq(1)
    end
  end

  describe "#clicked" do
    it "returns the number of opened emails" do

      expect(Email.clicked).to eq(1)
    end
  end

  describe "#find_total" do
    it "returns the number emails with specific type" do
      expect(Email.find_total("Shipment")).to eq(2)
    end
  end

  describe "#find_total_event" do
    it "returns the number emails with specific type" do
      expect(Email.find_total_event("Shipment","send")).to eq(1)
    end
  end






end
