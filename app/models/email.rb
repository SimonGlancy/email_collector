class Email < ApplicationRecord

  def as_json(options={})
    super(only: [:address,
                 :email_type,
                 :event,
                 :timestamp])

  end

  def self.sent
    Email.where(event: "send").size
  end

  def self.opened
    Email.where(event: "open").size
  end

  def self.clicked
    Email.where(event: "click").size
  end

  def self.find_total(email_type)
    Email.where(email_type: email_type).size
  end

  def self.find_total_event(email_type, event_type)
    Email.where(email_type: email_type, event: event_type).size
  end


  # def self.create_open_rate_hash
  #   open_rate = {}
  #   Email.all.each do |email|
  #     !open_rate.has_key?(email.email_type)
  #   end
  #
  # end

end
