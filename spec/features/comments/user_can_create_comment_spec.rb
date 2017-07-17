require 'rails_helper'

describe "User visits job page" do
  scenario "a user can create a new comment" do
    job = create(:job)

    visit '/companies'
    click_on job.company.name
    click_on job.title
    # binding.byebug
    fill_in 'comment[content]', with: "This is a comment"
    click_on 'Create Comment'

    expect(current_path).to eq("/jobs/#{job.company.id}")
    expect(page).to have_content("You created a comment for #{job.title}")
    expect(page).to have_content("This is a comment")
    expect(page).to have_content("#{job.created_at}")
    expect(page).to have_content("#{job.updated_at}")
  end

  # scenario "a user can create multiple comments in order" do
  #   job = create(:job)
  #   comment1 = create(:comment, job: job)
  #   comment2 = create(:comment, job: job)
  #   comment3 = create(:comment, job: job)
  #
  #   visit '/companies'
  #   click_on job.company
  #   click_on job.title
  #
  # end
end
