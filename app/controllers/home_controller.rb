class HomeController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def index

    if !user_signed_in?
      @projects = Project.all
    else
      @projects = Project.order(updated_at: :desc).find(:all,
                            :conditions => {:user_id => current_user.id})
    end
  end

  # def filter
  #   @projects = Project.find(:all,
  #                             :conditions => {:user_id => current_user.id})

  # end
end