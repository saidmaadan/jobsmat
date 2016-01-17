class ApplyMailer < ApplicationMailer

  def new_application(apply)
    @apply = apply
    @job = @apply.job
    #@current_candidate = current_candidate
    

    mail(to: @job.email,
      from: "hr@jobsmat.com",
      subject: "Application for #{@job.title}",
    )
  end
  # def new_application(current_candidate, job_employer, name, email, phone, message, job, resume)

  #   @current_candidate = current_candidate
  #   #@current_employer = current_employer
  #   @job_employer = job_employer
  #   @name = name
  #   @email = email
  #   @phone = phone
  #   @message = message
  #   @resume = resume
  #   @job = job

  #   mail(to: job_employer.email,
  #     from: "hr@jobsmat.com",
  #     subject: "Application Submitted",
  #   )
  # end
end