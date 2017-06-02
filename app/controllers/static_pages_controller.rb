class StaticPagesController < ApplicationController

  include ActionView::Helpers::TextHelper 

  def home
    @url_resume = download_resume
    unless params.blank? 
    end
  end

private

  def download_resume
      Aws.config.update({
          region: 'us-west-2',
          credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'],ENV['AWS_SECRET_ACCESS_KEY'])
      })
      s3 = Aws::S3::Resource.new
      object = s3.bucket('gilbertotovar').object('cvonline/cv.docx').presigned_url(:get, expires_in: 3600, response_content_disposition: 'attachment')
  end



end
