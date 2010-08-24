class JobSubCategoriesController < ApplicationController

  before_filter :find_all_job_sub_categories
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @job_sub_category in the line below:
    present(@page)
  end

  def options
    job_category = JobCategory.find_by_id(params[:job_category_id])
    @job_sub_categories = job_category.nil? ? [] : job_category.job_sub_categories
    render :layout => false
  end

  def show
    @job_sub_category = JobSubCategory.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @job_sub_category in the line below:
    present(@page)
  end

  protected

  def find_all_job_sub_categories
    @job_sub_categories = JobSubCategory.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/job_sub_categories")
  end

end
