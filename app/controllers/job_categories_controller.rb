class JobCategoriesController < ApplicationController
  before_action :get_category

  def jobs
  end

  def resumes
  end

  private

  def get_category
    @category = JobCategory.find(params[:job_category_id])
  end
end
