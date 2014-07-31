class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :job, class_name: "JobCategory"
end
