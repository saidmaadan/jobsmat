class ApplyMailer < ApplicationMailer
  def new_application(current_candidate, job_employer, name, email, phone, message, job, resume)

    @current_candidate = current_candidate
    @job_employer = job_employer
    @name = name
    @email = email
    @phone = phone
    @message = message
    @resume = resume
    @job = job

    mail(to: job_employer.email,
      from: "hr@jobsmat.com",
      subject: "Application Submitted",
    )
  end
end