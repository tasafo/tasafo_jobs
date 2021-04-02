class UsersController < ApplicationController
  before_action :authenticate_user!

  def update_setting
    setting = current_user.setting

    setting.update(setting_params)

    redirect_to root_path, notice: I18n.t('account.edit.setting_updated')
  end

  private

  def setting_params
    params.require(:setting).permit(:new_jobs, :new_resumes)
  end
end
