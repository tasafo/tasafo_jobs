class Resume < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, class_name: "JobCategory"

  scope :listed, -> { where(listed: true) }

  validates_presence_of :user, :category
  validates_presence_of :title, :name
end
