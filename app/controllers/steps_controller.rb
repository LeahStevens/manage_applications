class StepsController < ApplicationController

  before_action :require_login
  around_filter :catch_not_found


  def index
    @steps = Step.find(:all,
                            :conditions => {:project_id => current_project.id})

  end

  def new
    if params[:name] && params[:project_id]
      step = Step.new
      step.name = params[:name]
      step.project_id = params[:project_id]
      step.save
    else
    end
    render :layout => false
  end



  def create
    @step = Step.new(step_params)
    respond_to do |format|
      @step.project_id = current_project.id
      # if @step.save
      #   format.html { redirect_to @project, notice: 'Project was successfully created.' }
      #   format.json { render action: 'show', status: :created, location: @project }
      # else
      #   format.html { render action: 'new' }
      #   format.json { render json: @project.errors, status: :unprocessable_entity }
      # end
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    render :layout => false
  end


private

  def step_params
    params.require(:step).permit(:name, :checked ,:project_id)
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