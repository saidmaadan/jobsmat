class Job < ActiveRecord::Base
  mount_uploader :logo, LogoUploader
  belongs_to :employer
  belongs_to :company
  has_many :applies

  extend FriendlyId
  friendly_id :slug_jobs, use: :slugged
  searchkick
  
  def slug_jobs
    [
      :title,
      [:title, :skills],
      [:title, :skills, :email,],
      [:title, :skills, :email, :city],
      [:title, :skills, :email, :city, :zip_code]
    ]
  end

  validates :title, :experience, :position_type, :city, 
  :state, :country,  presence: true
  validates :description, length: { minimum: 25 }

  INDUSTRY = ['Accounting/Audit Tax', 'Administration/Office Support', 'Agriculture/Farming', 'Airlines/Aviation', 'Alcoholic Beverage', "Alternative Disputes Resolution", "Alternative Medicine", "Animation", "Apparel & Fashion", 
    "Architecture & Planning", "Arts & Crafts", "Automotive", "Banking/Finance/Insurance", "Biotechnology", "Broadcast Media", "Building Design/Materials", "Business Management Consulting", "Capital Markets", "Commercial Real Estate",
   "Computer Software", "Computer hardware & Network Security",'Communication', 'Community Services', "Constomer Services",  "Construction", 'Consumer Electronics', 'Consumer Services', "Creative Art Design", "Dairy", "Education Management", "E-Learning", 'Electrical/Electronic Manufacturing','Engineering', "Entertainment", "Food & Beverages", "Information Technology and Services",
    "Hospital & Health Care", "Import and Export", "Internet", "Government", "Legal", 'Logistics/Transportation', 'Manufacturing/Production', "Marketing and Advertising", "Military", "Nonprofit Organization Management",
   "Oil & Energy", "Online Platform", "Professional Training & Coaching", 'Project/Programme Management', "Property Management", "Real Estate","Restaurants", "Research", "Sales Development", "Security and Investigations", "Sports", "Staffing and Recruiting", "Supply Chain/Procurement", "Telecommunication","Tobacco", "Venture Capital & Private Equity", "Vocational Trades & Services", 'Wine and Spirits',"Other"]

  EXPERIENCE = ['Internship', 'Entry-level', 'Mid-level', 'Senior-level', "Associate", "Executive", "Director", "CEO", "Not Applicable"]
  POSITION_TYPE = ['Full Time', 'Part Time', 'Contract', 'Contract', "Contract to Hire", "Temporary", "Other"]
  EXPERIENCE = ['Internship', 'Entry-level', 'Mid-level', 'Senior-level', "Associate", "Executive", "Director", "CEO", "Not Applicable"]
  PAY_RATE = ['Hourly', 'Weekly', 'Monthly', 'Annually']
  TRAVEL_REQUIRED = ["NO", '0 - 20%', '20 - 40%', '40 - 60%', '60 - 80%', "80 - 100%"]
  COMPANY_SIZE = ["1 - 10 Employees", "11 - 50 Employees", "51 - 100 Employees", "101 - 200 Employees", "201 - 500 Employees", "501 - 1,000 Employees", "1,001 - 5,000 Employees", "5,001 - 10,000 Employees", "10,001 - 50,000 Employees","50,001 - 100,000 Employees", "100,001 - 200,000 Employees", "200,001 - 300,000 Employees", "300,001+ Employees"]

  def should_generate_new_friendly_id?
    new_record?
  end
end
