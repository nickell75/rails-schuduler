Rails.application.routes.draw do
  get 'work_order/index'

  root to: 'work_order#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
