require 'rails_helper'

describe "User visits category index" do
  scenario "can edit a category" do
    category = create(:category)

    visit '/categories'
    click_on 'Edit'

    fill_in "Title", with: "New Title"
    click_on 'Update Category'

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content "New Title"
    expect(page).to have_content "#{Category.last.title} updated!"
  end

  scenario "is redirected if makes duplicate category with error" do
    category1 = create(:category, title: "OldString")
    category2 = create(:category, title: "MyString")

    visit '/categories'
    click_on('Edit', match: :first)

    fill_in "Title", with: "MyString"
    click_on "Update Category"

    expect(current_path).to eq("/categories/#{category1.id}/edit")
    expect(page).to have_content 'That category already exists'
  end
end
