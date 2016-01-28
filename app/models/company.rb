class Company < ActiveRecord::Base
  mount_uploader :company_image, CompanyImageUploader
  mount_uploader :logo, LogoUploader
  belongs_to :employer
  belongs_to :candidate
  has_many :jobs
  has_many :reviews, dependent: :destroy
  has_many :follows, dependent: :destroy
  has_many :followers, through: :follows, source: :candidate
  has_many :followers, through: :follows, source: :employer

  extend FriendlyId
  friendly_id :slug_companies, use: :slugged
  searchkick
  
 INDUSTRY = ['Accounting/Audit Tax', 'Administration/Office Support', 'Agriculture/Farming', 'Airlines/Aviation', 'Alcoholic Beverage', "Alternative Disputes Resolution", "Alternative Medicine", "Animation", "Apparel & Fashion", 
    "Architecture & Planning", "Arts & Crafts", "Automotive", "Banking/Finance/Insurance", "Biotechnology", "Broadcast Media", "Building Design/Materials", "Business Management Consulting", "Capital Markets", "Commercial Real Estate",
   "Computer Software", "Computer hardware & Network Security",'Communication', 'Community Services', "Constomer Services",  "Construction", 'Consumer Electronics', 'Consumer Services', "Creative Art Design", "Dairy", "Education Management", "E-Learning", 'Engineering', "Entertainment", "Information Technology and Services",
    "Hospital & Health Care", "Import and Export", "Internet", "Government", "Legal", 'Logistics/Transportation', 'Manufacturing/Production', "Marketing and Advertising", "Military", "Nonprofit Organization Management",
   "Oil & Energy", "Online Platform", "Professional Training & Coaching", 'Project/Programme Management', "Property Management", "Real Estate","Restaurants", "Research", "Sales Development", "Security and Investigations", "Sports", "Staffing and Recruiting", "Supply Chain/Procurement", "Telecommunication", "Venture Capital & Private Equity", "Vocational Trades & Services", 'Wine and Spirits',"Other"]

  SIZE = ["1 - 10 Employees", "11 - 50 Employees", "51 - 100 Employees", "101 - 200 Employees", "201 - 500 Employees", "501 - 1000 Employees", "1001 - 5000 Employees", "5001 - 10000 Employees", "10001 - 20000 Employees", "20001 - 50000 Employees", "50001 - 100000 Employees", "100001 - 200000 Employees", "200000+ Employees"]
  
  def slug_companies
    [
      :name,
      [:name, :industry],
      [:name, :industry, :founded,],
      [:name, :industry, :founded, :size],
      [:name, :industry, :founded, :size, :location]
    ]
  end
  def company_job
    (company.jobs).size
  end

  def company_jobs
    select(jobs) { |job| job.company_name == company.name}.size
  end
end
