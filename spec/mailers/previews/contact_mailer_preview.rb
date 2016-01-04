# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email(name, email, subject, body)
    body = Contact.last
    ContactMailer.contact_email(name, email, subject, body)
  end
end
