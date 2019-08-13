# frozen_string_literal: true

module JobsHelper
  def categories_for_select(model)
    options = [[I18n.t('categories.select_category'), '']]
    options += JobCategory.all.map { |j| [j.name, j.id] }

    options_for_select(options, selected: model.category_id || '')
  end

  def search_jobs(job, job_checked)
    if job_checked.nil?
      @expired_in = t('jobs.expired_in')
      @expired = job.expire_at.strftime '%d/%m/%Y'
    else
      @expired = ''
    end
  end

  def checkbox_checked(checked)
    checked.nil? ? false : true
  end
end
