class ContactForm < MailForm::Base

  attribute :email,:validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :name, :validate => :true

  def headers
    {
      :subject => "Mensaje de www.gilbertotovar.com",
      :to => "tovarninogilberto@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end


end
