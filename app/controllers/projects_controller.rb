class ProjectsController < ActionController::Base
  def new
    Project.create(project_params)
  end

  def index

  end


  def project_params
    params.require(:project).permit(:name, :description, :icon, :user_id)
  end

end