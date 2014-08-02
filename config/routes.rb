TasafoJobs::Application.routes.draw do
  devise_for :users

  get "resumes/my_resume" => "resumes#my_resume", as: :my_resume
  get "resumes/edit" => "resumes#edit", as: :edit_resume
  put "resumes" => "resumes#update", as: :resumes
  resources :resumes, only: [:index, :show]

  resources :jobs do
    get :my_jobs, on: :collection, as: "my"
  end

  resources :job_categories, only: [:show]

  root 'jobs#index'
end
