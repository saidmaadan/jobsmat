require "rails_helper"

RSpec.feature "Candidate Sign-in" do
  before do
    @mike = Candidate.create!(email:"@mike@jobsmat.com", username: "mikesmat", password:"password")
  end
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"

    fill_in ("Email", with: @mike.email || "Username", with: "candidate")
    fill_in "Password", with: @mike.password
    click_button "Log In"

    expect(page).to have_content("You have signed in successfully")
  end
end