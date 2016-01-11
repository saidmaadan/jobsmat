class Company < ActiveRecord::Base
  mount_uploader :company_image, CompanyImageUploader
  mount_uploader :logo, LogoUploader
  has_many :jobs
  has_many :reviews, dependent: :destroy
  belongs_to :employer
  
  extend FriendlyId
  friendly_id :slug_companies, use: :slugged
  searchkick
  
  INDUSTRY = ['Accounting', 'Airlines/Aviation', "Alternative Disputs Resolution", "Alternative Medicine", "Animation", "Apparel & Fashion", 
    "Architecture & Planning", "Arts & Crafts", "Automotive", "Banking", "Biotechnology", "Broadcast Media", "Building Materials", "Capital Markets", "Commercial Real Estate",
   "Computer Software", "Computer hardware & Network Security", "Construction", 'Consumer Electronics', 'Consumer Services', "Dairy", "Education Management", "E-Learning", "Entertainment", "Financial Services", "Information Technology and Services",
   "Hospital & Health Care", "Import and Export", "Internet", "Government", "Legal", "Management Consulting", "Marketing and Advertising", "Military", "Nonprofit Organization Management",
   "Oil & Energy","Professional Training & Coaching", "Restaurants", "Research", "Security and Investigations", "Sports", "Staffing and Recruiting", "Transportation", "Venture Capital & Private Equity", "Other"]
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
end
