class ContactMailer < ApplicationMailer
  default from: "admin@example.com"

  def general_message(contact)
    @contact = contact
    mail( :to => "laconnexionmodeparis@gmail.com", :subject => "You Have a Message From Your Website")
  end
end
