require "rails_helper"

RSpec.feature "Editing a Jobs" do
  before do
    mike = Employer.create(email:"@mike@jobsmat.com" || username: "mikesmat", password:"password")
    login_as(mike)
    @job = Job.create(title:"The first title", description:"The first description", employer: mike)
  end

  scenario "An employer update a Job" do
    visit '/'
    click_link @job.title
    click_link "Editing Job"

    fill_in "Title", with: "Updated Job"
    fill_in "Description", with: "Updated job description"
    click_button "Update Job"

    expect(page).to have_content("Job has been updated")
    expect(page.current_path).to eq(job_path(@job))
  end

  scenario "An employer fails to update a Job" do
    visit '/'
    click_link @job.title
    click_link "Editing Job"

    fill_in "Title", with: ""
    fill_in "Description", with: ""
    click_button "Update Job"

    expect(page).to have_content("Job has not been updated")
    expect(page.current_path).to eq(job_path(@job))
  end
end

