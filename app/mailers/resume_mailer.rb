class ResumeMailer < ActionMailer::Base
  default from: 'nao-responda@trampos.tasafo.org'

  def new_resume(resume_id, recipient_id)
    @resume = Resume.find(resume_id)
    recipient = User.find(recipient_id)

    mail(to: recipient.email,
         subject: "[TRAMPOS] #{I18n.t('resumes.email.new_resume_subject')}")
  end
end
