class Email < ApplicationRecord

  def as_json(options={})
    super(only: [:Address,
                 :EmailType,
                 :Event,
                 :Timestamp])

  end

  def self.find_total_number(query_type)
    Email.where(query_type).size
  end

  def self.find_total_event(email_type, event_type)
    Email.where(EmailType: email_type, Event: event_type).size
  end

  def self.find_event_percentage(email_type, event_type)
    self.find_total_event(email_type, event_type).to_f / self.find_total_number(EmailType: email_type).to_f
  end

  def self.create_hash_for(event_type)
    requested_rate = {}
    Email.all.each do |email|
      if !requested_rate.has_key?(email.EmailType)
        requested_rate[email.EmailType.to_sym] = self.find_event_percentage(email.EmailType, event_type)
      end
    end
    requested_rate
  end

end
