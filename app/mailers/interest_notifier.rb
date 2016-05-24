class InterestNotifier < ApplicationMailer

  def send_data_request(message)
    @message = message
    mail(to: ENV['MESSAGE_EMAIL'], from: message.email,
         subject: 'Interest in data services')
  end

  def send_advert_request(message)
    @message = message
    mail(to: ENV['MESSAGE_EMAIL'], from: message.email,
         subject: 'Interest in advertising')
  end
end
