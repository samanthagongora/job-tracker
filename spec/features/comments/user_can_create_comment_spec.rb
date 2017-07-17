require 'rails_helper'

describe "User visits job page" do
  scenario "a user can create a new comment" do
    job = create(:job)

    visit '/companies'
    click_on job.company
    click_on job.title
    fill_in 'Content', with: "This is a comment"
    click_on 'Submit Comment'

    expect(current_path).to eq("/companies/#{job.company.id}")
    expect(page).to have_content("Comment added!")
    expect(page).to have_content("This is a comment")
    expect(page).to have_content("#{job.created_at}")
    expect(page).to have_content("#{job.updated_at}")
  end

  scenario "a user can create multiple comments in order" do
    job = create(:job)
    comment1 = create(:comment, job: job)
    comment2 = create(:comment, job: job)
    comment3 = create(:comment, job: job)

    visit '/companies'
    click_on job.company
    click_on job.title

    expect(page).to have
  end
end

The user can leave multiple comments on a job and the most recent comments are shown above older comments (in reverse of the order in which they were created).
