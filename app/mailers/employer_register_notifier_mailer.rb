class EmployerRegisterNotifierMailer < ApplicationMailer
  default :from => 'support@jobsmat.com'

  def send_employer_signup_email_to_admin(employer)
    @employer = employer
    mail( :to => 'sales@jobsmat.com',
    :subject => 'Thanks for signing up for our amazing Job and companies review portal' )
  end
end
