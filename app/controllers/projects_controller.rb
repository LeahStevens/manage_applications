class ProjectsController < ActionController::Base

  before_action :require_login

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def show
    # if
      @project = Project.find(params[:id])
    # else
    # redirect_to (:back)
    end
  end

  def completed
    @projects = Project.find(:all,
                              :conditions => {:completed => true, :user_id => current_user.id})
    # Where completed = true
  end

  def current
      @projects = Project.find(:all,
                              :conditions => {:completed => false, :user_id => current_user.id})
    # Where completed = false
  end

  def edit

  end

  def update

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

end