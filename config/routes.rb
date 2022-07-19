Rails.application.routes.draw do
  get 'menus/index'
  get 'restaurants/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 

  root to: "restaurants#index"
   resources :restaurants do 
    resources :menus 
  end 
end
