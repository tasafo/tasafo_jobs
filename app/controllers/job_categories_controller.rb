class JobCategoriesController < ApplicationController
  def show
    @category = JobCategory.find params[:id]
  end
end
