require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without info" do
        contact = Contact.new()

        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with attributes and company" do
        company = create(:company)
        contact = create(:contact, company: company)

        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      contact = create(:contact)

      expect(contact).to respond_to(:company)
    end
  end
end
