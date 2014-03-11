class ProjectsController < ActionController::Base

  before_action :require_login
  around_filter :catch_not_found

  def index
    @projects = Project.order(updated_at: :desc).find(:all,
                            :conditions => {:user_id => current_user.id})
  end

  def new
    @projects = Project.order(updated_at: :desc).find(:all,
                            :conditions => {:user_id => current_user.id})
    @project = Project.new
  end

  def show
    @projects = Project.order(updated_at: :desc).find(:all,
                            :conditions => {:user_id => current_user.id})
    @project = Project.find(params[:id])
  end

  def completed
    @projects = Project.order(updated_at: :desc).find(:all,
                              :conditions => {:completed => true, :user_id => current_user.id})
    # Where completed = true
  end

  def current
    @projects = Project.order(updated_at: :desc).find(:all,
                              :conditions => {:completed => false, :user_id => current_user.id})
    # Where completed = false
  end

  # def filter
  #   @projects = Project.find(:all,
  #                             :conditions => {:user_id => current_user.id})

  # end

  def edit
    @projects = Project.order(updated_at: :desc).find(:all,
                            :conditions => {:user_id => current_user.id})
    @project = Project.find(params[:id])

  end

  def update
    @projects = Project.order(updated_at: :desc).find(:all,
                            :conditions => {:user_id => current_user.id})
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to(:back)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to (:back)
  end

  def create
    @project = Project.new(project_params)
    respond_to do |format|
      @project.user_id = current_user.id
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def project_params
    params.require(:project).permit(:name, :description, :icon, :user_id, :completed)
  end

  def require_login
    if !user_signed_in?
      redirect_to root_url
    end
  end

  def catch_not_found
    yield
  rescue ActiveRecord::RecordNotFound
    redirect_to root_url, :flash => { :error => "Record not found." }
  end

end