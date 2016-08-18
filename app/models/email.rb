class Email < ApplicationRecord

  def as_json(options={})
    super(only: [:address,
                 :email_type,
                 :event,
                 :timestamp])

  end

  def self.find_total_number(query_type)
    Email.where(query_type).size
  end

  def self.find_total_event(email_type, event_type)
    Email.where(email_type: email_type, event: event_type).size
  end

  def self.find_event_percentage(email_type, event_type)
    event_total = self.find_total_event(email_type, event_type).to_f
    email_total = self.find_total_number(email_type: email_type).to_f
    (event_total/email_total).round(2)
  end

  def self.create_response
    {emails_sent: self.find_total_number(event: "send"),
     emails_opened: self.find_total_number(event: "open"),
     emails_clicked: self.find_total_number(event: "click"),
     open_rate: self.create_hash_for("open"),
     click_rate: self.create_hash_for("click")}
  end

  def self.create_hash_for(event_type)
    requested_rate = {}
    Email.all.each do |email|
      if !requested_rate.has_key?(email.email_type)
        requested_rate[email.email_type.to_sym] = self.find_event_percentage(email.email_type, event_type)
      end
    end
    requested_rate
  end

end
