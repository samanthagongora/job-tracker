class ContactsController < ApplicationController

  def create
    @company = Company.find(params[:company_id])
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

  def company_params
    params.permit(:id)
  end
end
