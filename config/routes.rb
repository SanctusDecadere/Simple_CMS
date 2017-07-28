Rails.application.routes.draw do


  root 'public#index'
  
  #get 'public/show'
  get 'show/:permalink', :to => 'public#show', :as => 'public_show'

  #root 'subjects#index'

  #get 'admin' :to => 'access#menu' 
  get 'access/menu'
  get 'access/login'
  post 'access/attempt_login'
  get 'access/logout'


    resources :admin_users, :except => [:show] do
    member do
      get :delete
    end
  end


  resources :subjects do
  	member do
  		get :delete
  	end
  end


   resources :pages do
   	member do
   		get :delete
   	end
   end



 resources :sections do 
 	member do
 		get :delete
 	end
 end



get 'demo/index'

get 'demo/hello'

get 'demo/other_hello'

get 'demo/lynda'

get 'demo/escape_output'

# This is an example of a simple match route
#get 'demo/index'


# This is an example of Default Route structure. Routes based on pattern.
# This method allows you not to have to be explicit about the action.
# May go away in future versions of rails. 
#get ':controller(/:action(:id))'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

