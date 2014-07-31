class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:my_account]

  def index
  end

  def my_account
  end
end
