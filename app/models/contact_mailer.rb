class ContactMailer < ActionMailer::Base

  def message(message)
    subject    message.subject
    body       :message => message
    recipients CONTACT_RECIPIENT
    from       message.email
    sent_on    Time.now
  end
end
