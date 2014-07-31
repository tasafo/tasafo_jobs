class JobCategory < ActiveRecord::Base
  has_many :jobs, foreign_key: "category_id"
end
