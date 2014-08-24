class Resume::Updater
  attr_reader :resume

  def initialize(resume)
    @resume = resume
  end

  def update(params)
    resume.update(params)

    Notifier.new.new_resume(resume).notify

    resume
  end
end