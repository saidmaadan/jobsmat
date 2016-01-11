class Review < ActiveRecord::Base
  belongs_to :company
  belongs_to :candidate
  belongs_to :employer
  self.per_page = 5

  extend FriendlyId
  friendly_id :slug_reviews, use: :slugged

  validates :rating, :pros, :cons, :advice, presence: true
  validates :rating, numericality:{ 
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 5,
    message: "Accept only a whole number between 1 and 5"
  }
  EMPLOYEE_STATUS = ["Full-Time", "Part-Time", "Contract", "Intern", "Freelancer" ]
  EMPLOYEE_TYPE = ["Current Employee", "Former Employee"]
  

  def slug_reviews
    [
      :company_name,
      [:company_name, :title],
      [:company_name, :title, :rating]
    ]
  end
end
