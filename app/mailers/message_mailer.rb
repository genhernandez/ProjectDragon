class MessageMailer < ApplicationMailer

require 'mailgun'

  def contact(message)
    @body = message.body
    mg_client = Mailgun::Client.new ENV['key-a76ab0bbe1ecca42f136e4193ce23598']
    message_params = {:from => message.email,
                      :to => ENV['mahamilton@mills.edu'],
                      :subject => 'Contact Form',
                      :text => message.body}
    mg_client.send_message ENV['cs170-mahamilton.c9users.io'], message_params
  end 
end 

