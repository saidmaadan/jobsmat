require "rails_helper"

RSpec.feature "Deleting a Jobs" do
  before do
    mike = Employer.create(email:"@mike@jobsmat.com" || username: "mikesmat", password:"password")
    login_as(mike)
    @job = Job.create(title:"The first title", description:"The first description", employer: mike)
  end

  scenario "An employer delete a Job" do
    visit '/'
    click_link @job.title
    click_link "Delete"

    expect(page).to have_content("Job has been deleted")
    expect(page.current_path).to eq(jobs_path
  end
end