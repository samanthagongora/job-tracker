require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without title" do
        category = Category.new()

        expect(category).to be_invalid
      end

      it "is invalid without unique title" do
        category1 = create(:category)
        category2 = Category.new(title: category1.title)

        expect(category2).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with title" do
        category = create(:category)

        expect(category).to be_valid
      end
    end
  end
end
