Rails.application.routes.draw do

  root 'reports#report2'
  get 'stocks/index',to:'stocks#index'

  resources :stocks

  get 'reports/report1',to: 'reports#report1', as: 'report1'
  get 'reports/report2',to: 'reports#report2', as: 'report2'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
