class ResumeMailer < ActionMailer::Base
  default from: "nao-responda@trampos.tasafo.org"

  def new_resume(resume, recipient)
    @resume = resume
    mail(to: recipient.email,
         subject: "[TRAMPOS] #{I18n.t('resumes.email.new_resume_subject')}")
  end
end