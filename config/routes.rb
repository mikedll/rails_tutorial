ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home"

  map.resources :posts, :has_many => :comments
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
