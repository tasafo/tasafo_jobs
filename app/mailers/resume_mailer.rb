class ResumeMailer < ApplicationMailer
  def new_resume(resume_id, recipient_id)
    @resume = Resume.find(resume_id)
    recipient = User.find(recipient_id)

    mail(to: recipient.email, subject: I18n.t('resumes.email.new_resume_subject'))
  end
end
