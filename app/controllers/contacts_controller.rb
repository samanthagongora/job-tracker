class ContactsController < ApplicationController
  def new
    @company = Company.find(params[:id])
    @contact = Contact.new
  end

  def create
    @company = Company.find(params[:id])
    @contact = Contact.new(contact_params.merge(company: @company))

    if @contact.save
      flash[:success] = "You created a contact for #{@company.name}"
    else
      flash[:notice] = "Contact information can't be blank!"
    end
    redirect_to company_path(@company)
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :position, :email)
  end
end
