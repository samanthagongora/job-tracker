require 'rails_helper'

describe "User visits category index" do
  scenario "can delete a category" do
    category1 = create(:category)
    category2 = create(:category)

    visit '/categories'
    click_on('Delete', match: :first)

    expect(current_path).to eq("/categories")
    expect(page).to have_content category2.title
    expect(page).to have_content "#{category1.title} was successfully deleted!"
  end
end
