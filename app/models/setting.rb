class Setting < ActiveRecord::Base
  belongs_to :user

  scope :new_jobs, -> { where(new_jobs: true) }
  scope :new_resumes, -> { where(new_resumes: true) }
end
