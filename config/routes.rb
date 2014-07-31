TasafoJobs::Application.routes.draw do
  devise_for :users

  get "resumes/my_resume" => "resumes#my_resume", as: :my_resume
  get "resumes/edit" => "resumes#edit", as: :edit_resume
  put "resumes" => "resumes#update", as: :resumes
  resources :resumes, only: [:index, :show]

  
  get "jobs/my_jobs" => "jobs#my_jobs", as: :my_jobs
  resources :jobs

  root 'home#index'
end
