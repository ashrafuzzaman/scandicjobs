class ApplicantsController < ApplicationController

  before_filter :find_all_applicants
  before_filter :find_page
  before_filter :login_required, :only => [:show]

  #works as a new form
  def index
    @applicant = Applicant.new
    render :new
  end

  def create
    @applicant = Applicant.create(params[:applicant])
    if(@applicant.valid?)
      flash[:notice] = "Application posted. We will be in touch soon"
      redirect_to :action => "index"
    else
      render :new
    end
  end

  def show
    @applicant = Applicant.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @applicant in the line below:
    present(@page)
  end

  protected

  def find_all_applicants
    @applicants = Applicant.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/applicants")
  end

end
