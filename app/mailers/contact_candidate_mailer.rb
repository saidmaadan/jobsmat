class ContactCandidateMailer < ApplicationMailer
  def new_message(contact_candidate)
    @contact_candidate = contact_candidate
    @candidate = @contact_candidate.candidate
    #@current_candidate = current_candidate
    

    mail(to: @candidate.email,
      from: "hr@jobsmat.com",
      subject: "You have a new message",
    )
  end
end