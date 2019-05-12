Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => redirect('/home/index')
  get '/home/index'
  post '/invoices/upload'

  resources :invoices
  
end
