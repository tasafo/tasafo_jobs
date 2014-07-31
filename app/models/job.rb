class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, class_name: "JobCategory"

  scope :owned_by, ->(user) { where(user: user) }

  validates_presence_of :category, :user
  validates_presence_of :title, :company_name, :contact_message, :description

  validates :site_url, format: { with: URI.regexp }, allow_nil: true
end
