require "rails_helper"

RSpec.feature "Listing Jobs" do
  before do
    @job1 = Job.create(title:"The first title", description:"The first description")
    @job2 = Job.create(title:"The second title", description:"The second description")
  end
  scenario "List all Jobs" do
    visit '/'

    expect(page).to have_content(@job1.title)
    expect(page).to have_content(@job1.description)
    expect(page).to have_content(@job2.title)
    expect(page).to have_content(@job2.description)
    expect(page).to have_link(@job1.title)
    expect(page).to have_link(@job2.title)
  end
end