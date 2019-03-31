class Notifier
  attr_reader :emails

  def initialize
    @emails = []
  end

  def new_job(job)
    recipients = Setting.new_jobs.map(&:user)
    recipients.delete job.user

    @emails += recipients.map do |recipient|
      JobMailer.new_job(job.id, recipient.id)
    end

    self
  end

  def new_resume(resume)
    recipients = Setting.new_resumes.map(&:user)
    recipients.delete resume.user

    @emails += recipients.map do |recipient|
      ResumeMailer.new_resume(resume.id, recipient.id)
    end

    self
  end

  def notify
    emails.each(&:deliver_later)
  end
end
