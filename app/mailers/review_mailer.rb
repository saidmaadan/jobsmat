class ReviewMailer < ApplicationMailer
  def review_created(current_employer, current_candidate, company_employer, pros, cons, advice)

    @current_employer = current_employer
    @current_candidate = current_candidate
    @company_employer = company_employer
    @pros = pros
    @cons = cons
    @advice = advice

    mail(to: current_employer.email,
      from: "hr@jobsmat.com",
      subject: "Review Created",
    )
  end
end
