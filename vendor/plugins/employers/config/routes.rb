ActionController::Routing::Routes.draw do |map|
  map.resources :employers

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :employers, :collection => {:update_positions => :post}
  end
end
