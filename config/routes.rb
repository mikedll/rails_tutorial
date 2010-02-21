ActionController::Routing::Routes.draw do |map|
  map.root :controller => "home"

  map.with_options :controller => "comment_wizard" do |c|
    c.cfirst "comment_wizard/first",  :action => "first"
    c.csecond "comment_wizard/second", :action => "second"
    c.cthird "comment_wizard/third", :action => "third"
    c.cfourth "comment_wizard/fourth", :action => "fourth"
  end

  map.resources :posts, :has_many => :comments
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
