require 'rails_helper'

describe "User visits a job" do
  scenario "can edit job information" do
    job = create(:job)

    visit "companies/#{job.company.id}/jobs"
    click_on job.title
    click_on 'Edit'
    fill_in 'Description', with: 'New Description'
    click_on 'Update Job'

    expect(page).to have_content 'New Description'
    expect(page).to have_content job.title
  end
end
