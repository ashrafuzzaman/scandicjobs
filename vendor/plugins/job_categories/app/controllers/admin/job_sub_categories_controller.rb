class Admin::JobSubCategoriesController < Admin::BaseController

  crudify :job_sub_category, :title_attribute => :title
  before_filter :find_job_category, :only => [:new, :create, :index, :edit, :update]

  def index
    paginate_all_job_sub_categorys
  end

  def create
    if (@job_sub_category = @job_category.job_sub_categories.create(params[:job_sub_category])).valid?
      flash.now[:notice] = "#{@job_sub_category.title} was successfully created."
      redirect_to admin_job_category_job_sub_categories_path(params[:job_category_id])
    else
      render :action => 'new'
    end
  end

  def update
    if @job_sub_category.update_attributes(params[:job_sub_category])
      flash.now[:notice] = "#{@job_sub_category.title} was successfully updated."
      redirect_to admin_job_category_job_sub_categories_path(params[:job_category_id])
    else
      render :action => 'edit'
    end
  end

  def destroy
    flash.now[:notice] = t('refinery.crudify.destroyed', :what => "#{@job_sub_category.title}") if @job_sub_category.destroy
    redirect_to admin_job_category_job_sub_categories_path(params[:job_category_id])
  end

  def find_job_category
    @job_category = JobCategory.find(params[:job_category_id])
  end

  def restrict_controller
    false
  end

  def paginate_all_job_sub_categorys
    @job_sub_categories = JobSubCategory.paginate :page => params[:page],
      :conditions => {:job_category_id => params[:job_category_id]}
  end
end
