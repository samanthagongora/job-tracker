require 'rails_helper'

describe "User visits company page" do
  scenario "a user can create a new contact" do
    company = create(:company)

    visit '/companies'
    click_on company.name
    fill_in 'contact[first_name]', with: "First"
    fill_in 'contact[last_name]', with: "Last"
    fill_in 'contact[position]', with: "Hiring Manager"
    fill_in 'contact[email]', with: "person@gmail.com"
    click_on 'Create Contact'

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content("You created a contact for #{company.name}")
    expect(page).to have_content("First")
    expect(page).to have_content("Last")
    expect(page).to have_content("Hiring Manager")
    expect(page).to have_content("person@gmail.com")
  end
end
