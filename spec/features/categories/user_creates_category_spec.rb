require 'rails_helper'

describe "User visits category index" do
  scenario "can create a new category" do
    visit '/categories'
    click_on 'New Category'

    fill_in "category[title]", with: "Carpentry"
    click_button "Create Category"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content category.title
  end

  scenario "is redirected if makes duplicate category with error" do
    category = create(:category)

    visit '/categories'
    click_on 'New Category'

    fill_in "category[title]", with: "My String"
    click_button "Create Category"

    expect(current_path).to eq("/categories/new")
    expect(page).to have_content 'That category already exists'
  end
end
