# frozen_string_literal: true

class JobsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create update edit my_jobs]

  def index
    @categories = search_jobs
  end

  def my_jobs
    # method empty
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    attrs = job_params.to_hash
    attrs[:user] = current_user

    @job = Job::Creator.new.create(attrs)

    if @job.persisted?
      redirect_to @job, notice: t('jobs.successfully_created')
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
      redirect_to @job, notice: t('jobs.successfully_updated')
    else
      render :new
    end
  end

  def destroy
    @job = current_user.jobs.find(params[:id])

    if @job.destroy
      redirect_to root_path, notice: t('jobs.successfully_destroyed')
    else
      redirect_to @job, alert: t('jobs.destroy_error')
    end
  end

  private

  def search_jobs
    if params[:jobs] != 'checked'
      JobCategory.with_joins.order('jobs.created_at DESC')
    else
      JobCategory.with_joins.order('jobs.created_at ASC')
    end
  end

  def job_params
    params.require(:job).permit(:company_name, :site_url,
                                :title, :description, :contact_message,
                                :location, :category_id, :days_to_expire,
                                :vacancy_completed)
  end
end
