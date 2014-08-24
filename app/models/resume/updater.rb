class Resume::Updater
  attr_reader :resume

  def initialize(resume)
    @resume = resume
  end

  def update(params)
    is_new = resume.new_record?

    resume.update(params)

    Notifier.new.new_resume(resume).notify if should_notify? is_new

    resume
  end

  private

  def should_notify? is_new
    is_new && resume.persisted?
  end
end