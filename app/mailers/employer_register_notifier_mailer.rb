class EmployerRegisterNotifierMailer < ApplicationMailer
  default :from => 'info@jobsmat.com'

  def send_employer_signup_email_to_admin(employer)
    @employer = employer
    mail( :to => 'sales@jobsmat.com',
    :subject => 'New Employer has just register' )
  end
end
