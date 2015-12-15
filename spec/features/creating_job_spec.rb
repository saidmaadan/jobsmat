require "rails_helper"

RSpec.feature "Creating Jobs" do
  before do
    @mike = Employer.create(email: "@mike@jobmats.com" || username: "mikesmat", password:"password")
    login_as(@mike)
  end
  scenario "An employer creates a new Job" do
    visit "/"

    click_link "Post a Job"
    fill_in "Title", with: "First Job"
    fill_in "Description", with: "This is the job description"

    click_button "Create Job"

    expect(page).to have_content("Job has been created")
    expect(page.current_path).to eq(jobs_path)
  end

  scenario "An employer fails to creates a new Job" do
    visit "/"

    click_link "Post a Job"
    fill_in "Title", with: ""
    fill_in "Description", with: ""

    click_button "Create Job"

    expect(page).to have_content("Job has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end
end
