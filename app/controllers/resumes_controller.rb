class ResumesController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit]

  def index
    @categories = JobCategory.all
  end

  def my_resume
    if current_user.resume
      redirect_to current_user.resume
    else
      redirect_to edit_resume_path
    end
  end

  def show
    @resume = Resume.find(params[:id])

    if @resume.listed? || (current_user && @resume.user == current_user)
      render :show
    else
      redirect_to resumes_path, alert: t("resumes.not_listed_error")
    end
  end

  def edit
    @resume = current_user.resume || current_user.build_resume
  end

  def update
    @resume = current_user.resume || current_user.build_resume
    Resume::Updater.new(@resume).update(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: t('resumes.updated') }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def resume_params
    params.require(:resume).permit(:category_id, :name, :description, :title,
                                    :facebook_url, :twitter_url, :google_plus_url,
                                    :linked_in_url, :phone, :site_url, :contact_email,
                                    :location, :listed, :available)
  end
end
