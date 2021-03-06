ActionController::Routing::Routes.draw do |map|
  map.resources :applicants

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :applicants, :collection => {:update_positions => :post}
  end
end
