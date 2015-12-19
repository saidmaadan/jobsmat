class Employer < ActiveRecord::Base
  mount_uploader :emp_image, EmpImageUploader
  mount_uploader :logo, LogoUploader
  has_secure_password

  extend FriendlyId
  friendly_id :username, use: :slugged
  searchkick
  validates :password, length: { minimum: 8, allow_blank: true }

  validates :name, presence: true
  validates :email_address, presence: true,
                  format: /\A\S+@\S+\z/,
                  uniqueness: { case_sensitive: false }

  validates :username, presence: true,
                     format: /\A[A-Z0-9]+\z/i,
                     uniqueness: { case_sensitive: false }

  has_many :jobs
  has_many :companies

  COMPANY_SIZE = ["1 - 10 Employees", "11 - 50 Employees", "51 - 100 Employees", "101 - 200 Employees", "201 - 500 Employees", "501 - 1000 Employees", "1001 - 5000 Employees", "5001 - 10000 Employees", "10001 - 20000 Employees", "20001 - 50000 Employees", "50001 - 100000 Employees", "100001 - 200000 Employees", "200000+ Employees"]
  INDUSTRY = ['Accounting', 'Airlines/Aviation', "Alternative Disputs Resolution", "Alternative Medicine", "Animation", "Apparel & Fashion", 
    "Architecture & Planning", "Arts & Crafts", "Automotive", "Banking", "Biotechnology", "Broadcast Media", "Building Materials", "Capital Markets", "Commercial Real Estate",
   "Computer Software", "Computer hardware & Network Security", "Construction", 'Consumer Electronics', 'Consumer Services', "Dairy", "Education Management", "E-Learning", "Entertainment", "Information Technology and Services",
   "Hospital & Health Care", "Import and Export", "Internet", "Government", "Legal", "Management Consulting", "Marketing and Advertising", "Military", "Nonprofit Organization Management",
   "Oil & Energy","Professional Training & Coaching", "Restaurants", "Research", "Security and Investigations", "Sports", "Staffing and Recruiting", "Transportation", "Venture Capital & Private Equity", "Other"]
  #validates :sex, inclusion: { in: SEX }

  before_create {generate_token(:auth_token)}

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    EmployerMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Employer.exists?(column => self[column])
  end

  def gravatar_id
    Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email_or_username, password)
    employer = Employer.find_by(email: email_or_username) || Employer.find_by(username: email_or_username)
    employer && employer.authenticate(password)
  end

  def should_generate_new_friendly_id?
      new_record?
  end
end
