class EmployerNotifier < ApplicationMailer
  default :from => 'support@jobsmat.com'

  def send_signup_email(employer)
    @employer = employer
    mail( :to => @employer.email,
    :subject => 'Thanks for signing up for our amazing Job and companies review portal' )
  end
end
