class Admin::EmployersController < Admin::BaseController

  crudify :employer, :title_attribute => :name

end
