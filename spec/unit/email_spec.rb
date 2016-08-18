require 'rails_helper'

describe Email, 'testing emails' do

  before(:each) do
    @email1 = Email.create("address":"barney@lostmy.name","email_type":"Shipment","event":"send","timestamp":1432820696)
    @email2 = Email.create("address":"tom@lostmy.name","email_type":"UserConfirmation","event":"click","timestamp":1432820702)
    @email3 = Email.create("address":"vitor@lostmy.name","email_type":"Shipment","event":"open","timestamp":1432820704)
  end


  describe "#find_total" do
    it "returns the number of sent emails" do
      expect(Email.find_total_number(event: "send")).to eq(1)
    end

    it "returns the number of opened emails" do
      expect(Email.find_total_number(event: "open")).to eq(1)
    end

    it "returns the number of clicked emails" do
      expect(Email.find_total_number(event: "send")).to eq(1)
    end

    it "returns the number emails with specific type" do
      expect(Email.find_total_number(email_type: "Shipment")).to eq(2)
    end
  end

  describe "#find_total_event" do
    it "returns the number emails with specific type" do
      expect(Email.find_total_event("Shipment","send")).to eq(1)
    end
  end

  describe "find_event_percentage" do
    it "returns the percentage for a specific event type" do
      expect(Email.find_event_percentage("Shipment","send")).to eq(0.5)
    end

  end

  describe "#create_hash_for" do
    it "returns a hash of the requested open rates" do
      expect(Email.create_hash_for("open")).to eq({Shipment: 0.5, UserConfirmation: 0.0})
    end

    it "returns a hash of the requested clicked rates" do
      expect(Email.create_hash_for("click")).to eq({Shipment: 0, UserConfirmation: 1.0})
    end
  end

end
