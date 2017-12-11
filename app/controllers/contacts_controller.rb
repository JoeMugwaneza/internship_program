class ContactsController < ApplicationController
  before_action :authenticate_user!, :only => [:index, :edit, :update, :destory]
  def index
    @contacts = Contact.all
    render json: @contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to welcome_path
    else
      render :new 
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:fname, :phone_number, :email, :message)
  end
end
