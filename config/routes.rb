Rails.application.routes.draw do
  devise_for :users

  get "resumes/my_resume" => "resumes#my_resume", as: :my_resume
  get "resumes/edit" => "resumes#edit", as: :edit_resume
  put "resumes" => "resumes#update", as: :resumes

  resources :resumes, only: [:index, :show]

  put 'users/setting', controller: :users, action: :update_setting, as: :update_user_setting

  resources :jobs do
    get :my_jobs, on: :collection, as: "my"
  end

  resources :job_categories, only: :none do
    get :resumes
    get :jobs
  end

  root 'jobs#index'
end
