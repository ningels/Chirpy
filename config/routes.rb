Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Left side matches what comes in from the URL.  If you just use
  #a web interface, you only have access to the HTTP verb get.  If you use
  #postman you have other verbs.  The right side looks for a controller with
  #the and a method within that controller.  So user#index looks for an index
  #method in the user_controller.rb.

#  route http verbs
#
#  post users signup creating new user
#  post login doesn't create new, but matches id and password and gives back
#  whole record with token (not password)
#  post and get chirps

    get '/users'  => 'user#index'
    post '/signup' => 'user#create'



end
