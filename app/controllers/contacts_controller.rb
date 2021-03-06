class ContactsController < ApplicationController
  layout "front"

  def new
    @contactpaginas = Contactpagina.find(1)
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      redirect_to root_path, notice: 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end