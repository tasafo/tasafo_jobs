# frozen_string_literal: true

module JobsHelper
  def categories_for_select(model)
    options = [[I18n.t('categories.select_category'), '']]
    options += JobCategory.all.map { |j| [j.name, j.id] }

    options_for_select(options, selected: model.category_id || '')
  end

  def checkbox_checked(checked)
    !checked.nil?
  end
end
