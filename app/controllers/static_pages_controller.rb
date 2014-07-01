class StaticPagesController < ApplicationController
  include ActionView::Helpers::TextHelper 
  def home
    unless params.blank? 
      c = ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"])
      if c.deliver

        begin

          account_sid = ENV['TWILIO_ACCOUNT_SID']
          auth_token  = ENV['TWILIO_AUTH_TOKEN']
          client = Twilio::REST::Client.new account_sid, auth_token

          from = "+16096442390" # Your Twilio number

          friends =  "+5218113129230"
            client.account.messages.create(
              :from => from,
              :to => friends,
              :body => "Tienes un email de #{params["name"]} y dice, #{truncate(params["message"], length: 100)}"
            ) 
            puts "\n\n Sent message to #{friends}"
        rescue Twilio::REST::RequestError => e
          puts "#{e.message} ERROR"
        end

      end
    end
  end
end
