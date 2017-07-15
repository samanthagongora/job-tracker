require 'rails_helper'

describe "User visits a job" do
  scenario "can delete job information" do
    job1 = create(:job)
    job2 = create(:job, company: job1.company)

    visit "companies/#{job1.company.id}/jobs"
    click_on job1.title
    click_on 'Delete'

    expect(page).to have_link job2.title
    expect(page).to have_no_link job1.title
  end
end
