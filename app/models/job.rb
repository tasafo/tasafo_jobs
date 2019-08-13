class Job < ActiveRecord::Base
  belongs_to :user
  belongs_to :category, class_name: 'JobCategory'

  scope :owned_by, ->(user) { where(user: user) }
  default_scope -> { order('id DESC') }

  validates_presence_of :category, :user
  validates_presence_of :title, :company_name, :contact_message, :description

  validates :site_url,
            format: { with: URI::DEFAULT_PARSER.make_regexp },
            allow_blank: true
  
  def search_jobs(job_checked)
    if job_checked != 'checked'
      JobCategory.with_joins.where('jobs.expire_at >= ?', DateTime.now)
    else
      JobCategory.with_joins.order('jobs.created_at ASC')
    end
  end
end
