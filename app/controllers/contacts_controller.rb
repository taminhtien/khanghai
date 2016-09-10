class ContactsController < ApplicationController
  layout 'pages'

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      flash[:success] = 'Your message was sent successfully. Thanks.'
      redirect_to contact_us_path
    else
      flash[:danger] = 'Validation errors occurred. Please confirm the fields and submit it again.'
      render :new
    end
    
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :phone_number, :subject, :message)
  end
end