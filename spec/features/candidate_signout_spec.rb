require "rails_helper"

RSpec.feature "Signing out signed-in candidates" do
  
  before do
    @mike = Candidate.create!(email: "mike@example.com", username: "mikesmat", password: "password")
    visit "/"
    
    click_link "Sign in"
    fill_in "Email", with: @mike.email || "Username", with: "employer")
    fill_in "Password", with: @mike.password
    click_button "Log in"
  end
  
  scenario do
    visit "/"
    click_link "Sign out"
    expect(page).to have_content("Signed out successfully.")
  end
end