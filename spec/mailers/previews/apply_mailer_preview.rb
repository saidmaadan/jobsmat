# Preview all emails at http://localhost:3000/rails/mailers/apply_mailer
class ApplyMailerPreview < ActionMailer::Preview
  def new_application
    apply = Apply.last 
    Applymailer.new_application(apply)
  end
end
