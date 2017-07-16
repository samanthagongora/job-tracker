require 'rails_helper'

describe "User visits home page" do
  scenario "sees category and company links" do

    visit '/'

    expect(page).to have_link("Categories")
    expect(page).to have_link("Companies")
  end
end
