require 'rails_helper'

describe "User visits category index" do
  scenario "can create a new category" do
    visit '/categories'
    click_on 'New Category'

    fill_in "category[title]", with: "Carpentry"
    click_button "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content Category.last.title
  end

  scenario "is redirected if makes duplicate category with error" do
    category = create(:category, title: "MyString")

    visit '/categories'
    click_on 'New Category'

    fill_in "category[title]", with: "MyString"
    click_button "Create Category"

    expect(current_path).to eq("/categories/new")
    expect(page).to have_content 'That category already exists'
  end
end
