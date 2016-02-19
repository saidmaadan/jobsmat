class CandidateRegisterNotifierMailer < ApplicationMailer
  default :from => 'info@jobsmat.com'

  def send_candidate_signup_email_to_admin(candidate)
    @candidate = candidate
    mail( :to => 'sales@jobsmat.com',
    :subject => 'Thanks for signing up for our amazing Job and companies review portal' )
  end
end
