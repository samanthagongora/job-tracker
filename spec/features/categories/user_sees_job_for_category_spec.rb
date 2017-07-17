require 'rails_helper'

describe "User visits a category" do
  scenario "sees all jobs for category" do
    category = create(:category)
    job1 = create(:job, category: category)
    job2 = create(:job, category: category)
    job3 = create(:job)

    visit '/categories'
    click_on category.title

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content category.title
    expect(page).to have_link job1.title
    expect(page).to have_link job2.title
  end
end
