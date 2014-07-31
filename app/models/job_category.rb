class JobCategory < ActiveRecord::Base
  has_many :jobs, foreign_key: "category_id"
  has_many :resumes, foreign_key: "category_id"

  validates_presence_of :name
end
