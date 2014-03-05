class ProjectsController < ActionController::Base

  def current_list

  end

  def completed_list

  end

  def new
    Project.create(project_params)
  end

  def project

  end

  def edit

  end

  def project_params
    params.require(:project).permit(:name, :description, :icon, :user_id)
  end

end