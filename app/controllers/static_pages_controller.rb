class StaticPagesController < ApplicationController
  def home
    @proyects = Proyect.all
    unless params.blank? 
      c = ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"])
      if c.deliver

        begin

          account_sid = ENV['TWILIO_ACCOUNT_SID']
          auth_token  = ENV['TWILIO_AUTH_TOKEN']
          client = Twilio::REST::Client.new account_sid, auth_token

          from = "+16096442390" # Your Twilio number

          friends = {
            "+5218113129230" => "Gilberto",
          }
          friends.each do |key, value|
            client.account.messages.create(
              :from => from,
              :to => key,
              :body => "Tienes un email de #{params["name"]} y dice, #{truncate(params["message"], length: 100)}"
            ) 
            puts "\n\n Sent message to #{value}"
          end
        rescue Twilio::REST::RequestError => e
          puts e.message
        end

        redirect_to root_path
      end
    end
  end
end
