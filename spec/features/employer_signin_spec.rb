require "rails_helper"

RSpec.feature "Employer Sign-in" do
  before do
    @mike = Employer.create!(email:"@mike@jobsmat.com", username: "mikesmat", password:"password")
  end
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"

    fill_in ("Email", with: @mike.email || "Username", with: "employer")
    fill_in "Password", with: @mike.password
    click_button "Log In"

    expect(page).to have_content("You have signed in successfully")
  end
end