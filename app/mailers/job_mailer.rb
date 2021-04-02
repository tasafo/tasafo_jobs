class JobMailer < ApplicationMailer
  def new_job(job_id, recipient_id)
    @job = Job.find(job_id)
    recipient = User.find(recipient_id)

    mail(to: recipient.email, subject: I18n.t('jobs.email.new_job_subject'))
  end
end
