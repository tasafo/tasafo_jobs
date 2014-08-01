class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :my_jobs]

  def index
    @categories = JobCategory.all
  end

  def my_jobs
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.build(job_params)

    if @job.save
      redirect_to @job, notice: t("jobs.successfully_created")
    else
      render :new
    end
  end

  def edit
    @job = current_user.jobs.find(params[:id])
  end

  def update
    @job = current_user.jobs.find(params[:id])

    if @job.update_attributes(job_params)
      redirect_to @job, notice: t("jobs.successfully_updated")
    else
      render :new
    end
  end

  def destroy
    @job = current_user.jobs.find(params[:id])

    if @job.destroy
      redirect_to root_path, notice: t("jobs.successfully_destroyed")
    else
      redirect_to @job, alert: t("jobs.destroy_error")
    end
  end

  private

  def job_params
    params.require(:job).permit(:company_name, :site_url,
                                :title, :description, :contact_message,
                                :location, :category_id)
  end
end
