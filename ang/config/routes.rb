Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'sign_up' =>'example#index', :as=>'sign_up'
  #get 'sign_in' =>'sessions#user_sign_in_form', :as=>'sign_in_form'
  #post 'sign_in' =>'sessions#user_sign_in', :as=>'sign_in'
  #get 'log_out' =>'sessions#session_destroy', :as=>'log_out'
  root 'example#index'
end
