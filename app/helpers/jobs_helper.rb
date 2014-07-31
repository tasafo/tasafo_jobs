module JobsHelper
  def jobs_for_select
    options = [[I18n.t("categories.select_category"), ""]] 
    options = options + JobCategory.all.map { |j| [j.name, j.id] }
    
    options_for_select(options, selected: @job.category_id || "")
  end
end
