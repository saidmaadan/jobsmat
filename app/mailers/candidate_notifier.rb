class CandidateNotifier < ApplicationMailer
  default :from => 'support@jobsmat.com'

  def send_signup_email(candidate)
    @candidate = candidate
    mail( :to => @candidate.email,
    :subject => 'Thanks for signing up for our amazing Job and companies review portal' )
  end
end
