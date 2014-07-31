class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, class_name: "JobCategory"

  scope :listed, -> { where(listed: true) }
end
