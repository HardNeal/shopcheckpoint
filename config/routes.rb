
Rails.application.routes.draw do
 # scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

 scope ":locale", locale: /en|ru/ do	

	root 'products#index'
	get 'products/show/:id' => 'products#show', as: 'products_show'
	get 'categories/show/:id' => 'categories#show', as: 'categories_show'

	namespace :admin do
    	root 'products#index'
    	resources :products
    	resources :categories
  	end
end
	devise_for :users
	match "*path", to: redirect("/#{I18n.default_locale}/%{path}"), via: :all	
    match "", to: redirect("/#{I18n.default_locale}/"), via: :all
end














# root 'posts#index'	  
# resources :posts do
# member do
# get 'close'	  		
# get 're_open'	  	
# end	  	
# collection do
# get 'search'
# end
# end
# end	
