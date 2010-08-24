ActionController::Routing::Routes.draw do |map|
  map.resources :job_categories do |job_category|
    job_category.resources :job_sub_categories, :collection => {:options => :get}
  end

  map.namespace(:admin, :path_prefix => 'refinery') do |admin|
    admin.resources :job_categories, :collection => {:update_positions => :post} do |job_category|
      job_category.resources :job_sub_categories
    end
  end

end
