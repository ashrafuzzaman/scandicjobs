class Admin::ApplicantsController < Admin::BaseController

  crudify :applicant, :title_attribute => :name

end
