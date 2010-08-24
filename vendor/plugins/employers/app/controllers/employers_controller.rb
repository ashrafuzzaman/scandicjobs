class EmployersController < ApplicationController

  before_filter :find_all_employers
  before_filter :find_page
  before_filter :login_required, :only => [:show]

  def index
    @employer = Employer.new
    render :new
  end

  def create
    @employer = Employer.create(params[:employer])
    if(@employer.valid?)
      flash[:notice] = "Job is posted. We will be in touch soon"
      redirect_to :action => "index"
    else
      render :new
    end
  end

  def show
    @employer = Employer.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @employer in the line below:
    present(@page)
  end

protected

  def find_all_employers
    @employers = Employer.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/employers")
  end

end
