class ContactsController < ApplicationController
  def create
    @contact = Contact.new
  end
  def new
    @contact = Contact.new(params[:contact])
    if @contact.save
      ContactsMailer.general_message(@contact).deliver
      render root_path
    else
      render :new
    end
  end
end
