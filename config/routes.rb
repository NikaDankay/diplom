Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :items
  get 'documents/index'

  get 'documents/new'

  get 'documents/create'

  get 'documents/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'home#index'
  get 'teacher/registration', to: 'teacher#index'
  get 'user/registration', to: 'user#index'
  get 'admin/registration', to: 'admin#index'
  get 'admin/dashboard', to: 'admin#dashboard'

  get 'teacher/login', to: 'teacher#login'
  get 'user/login', to: 'user#login'
  get 'admin/login', to: 'admin#login'
  get 'admin', to: 'admin#dashboard'
  get 'admin/approveDiplomas', to: 'admin#approveDiplomas'

  get 'admin/logout', to: 'admin#logout'
  get 'user/logout', to: 'user#logout'
  get 'teacher/logout', to: 'teacher#logout'
  get 'studentlist', to: 'admin#studentList'
  get 'teacherlist', to: 'admin#teacherList'
  get 'user/dashboard', to: 'user#dashboard'
  get 'teacher/dashboard', to: 'teacher#dashboard'
  get 'user/registerDiploma', to: 'user#registerDiploma'
  post 'user/registerDiploma', to: 'user#registerDiploma'

  get 'admin/registerDiploma', to: 'admin#registerDiploma'
  get 'admin/sendEmailTo', to: 'admin#sendEmailTo'
  post 'admin/registerDiploma', to: 'admin#registerDiploma'

  post 'admin/registerAdministrator', to: 'admin#registerAdministrator'
  post 'admin/loginAdministrator', to: 'admin#loginAdministrator'

  post 'teacher/registerTeacher', to: 'teacher#registerTeacher'
  post 'teacher/loginTeacher', to: 'teacher#loginTeacher'


  post 'user/registerUser', to: 'user#registerUser'
  post 'user/loginUser', to: 'user#loginUser'

  get 'teacher/upload', to: 'documents#index'
  get 'documents/new', to: 'documents#new'

  post 'documents/new', to: 'documents#new'
  post 'documents/save', to: 'documents#create'

  get 'teacher/createNew', to: 'teacher#createNew'
  post 'teacher/createNew', to: 'teacher#createNew'

get 'user/news', to: 'user#news'


end
