class Interview < ActiveRecord::Base
  belongs_to :company
  belongs_to :candidate
  belongs_to :employer
  self.per_page = 5

  extend FriendlyId
  friendly_id :slug_interviews, use: :slugged

  validates :job_title, :process, :questions, :when, :where, presence: true
  INTERVIEW_DIFFICULTY = ['Very Easy', 'Easy', 'Average', 'Very Difficult', "Difficult"]
  HOW_HEARD = ['Online', 'Employee Referral', 'Staffing Agency', 'Recruiter', "In-Person", "College or University", "Other"]
  HOW_HELPFUL = ['Very helpful', 'Helpful', 'Not helpful', 'I do not use Job-Inbox for my interview preparation']
  WHEN = ['2016', '2015', '2014', '2013', '2012', '2011', '2010', '2009', '2008', '2007', '2006', '2005', '2004']
  WHEN_MONTH = ['January', 'Febuary', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'Octomber', 'November', 'December']
  DURATION_DAYS = ['Days', 'Weeks', 'Months']
  HIRED = ['Yes', 'No']

  def slug_interviews
    [
      :job_title,
      [:job_title, :how_heard],
      [:job_title, :how_heard, :interview_difficulty,],
      [:job_title, :how_heard, :interview_difficulty, :hired,],
      [:job_title, :how_heard, :interview_difficulty, :hired, :duration_days]
    ]
  end
end
