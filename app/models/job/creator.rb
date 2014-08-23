class Job::Creator
  def create(params)
    job = Job.create(params)
    Notifier.new.new_job(job).notify if job.persisted?
    job
  end
end