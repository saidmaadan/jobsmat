require "rails_helper"

RSpec.feature "Showing Job details" do 
  before do
    @mike = Employer.create((email:"@mike@jobsmat.com", username: "mikesmat", password:"password")
    @miller = Employer.create(email:"@miller@jobsmat.com", username: "millersmat", password:"password")
    @job = Job.create(title:"The first title", description:"The first description", employer:@mike)
  end

  scenario "Display individual Job" do
    visit "/"
    click_link @job.title

    expect(page).to have_content(@job.title)
    expect(page).to have_content(@job.description)
    expect(current_path).to eq(job_path(@job))
  end

  scenario "A non-signed in employer or candidate does not see edit or delete links" do 
    visit "/"
    click_link @job.title

    expect(page).to have_content(@job.title)
    expect(page).to have_content(@job.description)
    expect(current_path).to eq(job_path(@job))
    expect(page).not_to have_link("Edit Job")
    expect(page).not_to have_link("Delete")
  end

  scenario "A non-owner signed in cannot see both Edit and Delete links" do
    login_as(@miller)
    visit "/"
    click_link @job.title

    expect(page).not_to have_link("Edit Job")
    expect(page).not_to have_link("Delete")
  end

  scenario "A signed in owner sees both Edit and Delete links" do
    login_as(@mike)
    visit "/"
    click_link @job.title

    expect(page).to have_link("Edit Job")
    expect(page).to have_link("Delete")
  end
end

