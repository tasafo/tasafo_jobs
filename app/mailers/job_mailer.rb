class JobMailer < ActionMailer::Base
  default from: 'nao-responda@trampos.tasafo.org'

  def new_job(job_id, recipient_id)
    @job = Job.find(job_id)
    recipient = User.find(recipient_id)

    mail(to: recipient.email,
         subject: "[TRAMPOS] #{I18n.t('jobs.email.new_job_subject')}")
  end
end
