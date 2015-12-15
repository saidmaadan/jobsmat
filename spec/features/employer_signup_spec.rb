require "rails_helper"

RSpec.feature "Employers Sign-up" do
  scenario "with valid credentials" do
    visit "/"
    click_link "Sign up"

    fill_in "Email", with: "employer@jobsmat.com"
    fill_in "Username", with: "employer"
    fill_in "Password", with: "password"
    click_button "sign up"

    expect(page).to have_content("You have signed up successfully")
  end
end