class AddVacancyCompletedToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :vacancy_completed, :boolean
  end
end
