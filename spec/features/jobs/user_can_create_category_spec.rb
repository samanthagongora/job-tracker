require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new category" do
    company = create(:company, name: "ESPN")

    visit '/companies'
    click_on 'ESPN'
    click_on 'New Job'

    click_on 'New Category'

    fill_in "category[title]", with: "Something"

    click_button "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("#{Category.last.title} added!")
  end
end
