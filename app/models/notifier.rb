class Notifier
  attr_reader :emails

  def initialize
    @emails = []
  end

  def new_job(job)
    recipients = Setting.new_jobs.map { |setting| setting.user }
    recipients.delete job.user

    @emails = @emails + recipients.map do |recipient|
      JobMailer.new_job(job, recipient)
    end

    self
  end

  def notify
    emails.each do |email|
      email.deliver
    end
  end
end