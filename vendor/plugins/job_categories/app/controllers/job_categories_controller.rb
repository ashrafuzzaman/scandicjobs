class JobCategoriesController < ApplicationController

  before_filter :find_all_job_categories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @job_category in the line below:
    present(@page)
  end

  def show
    @job_category = JobCategory.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @job_category in the line below:
    present(@page)
  end

protected

  def find_all_job_categories
    @job_categories = JobCategory.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/job_categories")
  end

end
