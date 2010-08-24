class Admin::JobCategoriesController < Admin::BaseController

  crudify :job_category, :title_attribute => :title

end
