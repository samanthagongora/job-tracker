require 'rails_helper'

describe "User creates a new job" do
  scenario "a user can create a new job" do
    company = create(:company, name: "ESPN")
    category = create(:category)

    visit '/companies'
    click_on 'ESPN'
    click_on 'New Job'

    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    select category.title, from: "job_category_id"

    click_button "Create Job"

    expect(current_path).to eq("/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content("Denver")
  end
end
