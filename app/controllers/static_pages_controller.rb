class StaticPagesController < ApplicationController

  include ActionView::Helpers::TextHelper 

  def loaderio
      @loaderio_token = ENV['LOADER_TOKEN']
      respond_to do |format|
          format.html {render :layout => false}
      end
  end
  
  def send_email
      unless params["email"].blank? 
          puts "estamos dentro de params.blank #{params.inspect}"
          @c = ContactForm.new(:name => params["name"],:email => params["email"], :message => params["message"])
          if verify_recaptcha(model: @c,response:  params['g-recaptcha-response']) && @c.deliver
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
                  puts "#{e.message} ERROR de Twilio"
              end
          else
              @c.errors.add(:base, "Error captcha no paso la validacion")
          end
      end
      respond_to do |format|
          format.html {render :layout => false}
      end
  end
  
  def home
      fetch_proyects_experience
      @experiences = Experience.includes(:proyects,:translations).order(start_date: :desc)
      params.permit(:"g-recaptcha-response")
      @url_resume = download_resume
      expires_in 1.year, :public => true
  end

  def fetch_proyects_experience
      proyects_experience =  $redis.get("proyects_experience")
      if proyects_experience.nil?
          proyects_experience = Proyect.proyects_experience.to_json
          $redis.set("proyects_experience", proyects_experience)
          # Expire the cache, every 5 hours
          $redis.expire("proyects_experience",1.year.to_i)
      end
      @proyects = JSON.load proyects_experience
  end

private

  def download_resume
      Aws.config.update({
          region: 'us-west-2',
          credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],ENV['AWS_SECRET_ACCESS_KEY'])
      })
      s3 = Aws::S3::Resource.new
      object = s3.bucket('gilbertotovar').object('cvonline/cv.pdf').presigned_url(:get, expires_in: 3600, response_content_disposition: 'attachment')
  end



end
