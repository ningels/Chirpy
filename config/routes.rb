Rails.application.routes.draw do
#     For details on the DSL available within this file, see
#           http://guides.rubyonrails.org/routing.html
# Left side matches what comes in from the URL.  If you just use
# a web interface, you only have access to the HTTP verb get.  If you use
# postman you have other verbs.  The right side looks for a controller with
# the given method.  So user#index looks for an index method in the
# user_controller.rb.
#
#  route http verbs created when I did a rails g resource chirps
#
#  Prefix    Verb   URI Pattern                Controller#Action
#   chirps    GET   /chirps(.:format)           chirps#index
#            POST   /chirps(.:format)           chirps#create
# new_chirp   GET   /chirps/new(.:format)       chirps#new
# edit_chirp  GET   /chirps/:id/edit(.:format)  chirps#edit
#  chirp      GET   /chirps/:id(.:format)       chirps#show
#           PATCH   /chirps/:id(.:format)       chirps#update
#             PUT   /chirps/:id(.:format)       chirps#update
#          DELETE   /chirps/:id(.:format)       chirps#destroy
#
  resources :chirps
    get '/users'         => 'user#index'
    post '/signup'       => 'user#create'
    post '/login'        => 'sessions#create'
    post '/message'      => 'chirps#create'   #I think Kelsey used message
    post '/follow'       => 'follow#create'
    post '/unfollow'     => 'unfollow#delete'
end
