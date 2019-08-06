# frozen_string_literal: true

module JobsHelper
  def categories_for_select(model)
    options = [[I18n.t('categories.select_category'), '']]
    options << JobCategory.all.map { |j| [j.name, j.id] }

    options_for_select(options, selected: model.category_id || '')
  end

  def search_jobs(job)
    created_date = job.created_at
    days_to_expire = job.days_to_expire

    date_to_expire = created_date + (60 * 60 * 24 * days_to_expire.to_i)

    @exact_date = if created_date < date_to_expire
                    date_to_expire.strftime '%d/%m/%Y'
                  else
                    t('jobs.expired')
                  end

    @expired_in = @exact_date != t('jobs.expired') ? t('jobs.expired_in') : ''

    @expired = expired(date_to_expire)
  end

  def expired(date_to_expire)
    if date_to_expire
      @exact_date
    else
      t('jobs.expired_in')
    end
  end

  def checkbox_checked(checked)
    checked.nil? ? false : true
  end
end
