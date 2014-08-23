class JobMailer < ActionMailer::Base
  default from: "nao-responda@trampos.tasafo.org"

  def new_job(job, recipient)
    @job = job
    mail(to: recipient.email,
         subject: "[TRAMPOS] #{I18n.t('jobs.email.new_subject')}")
  end
end