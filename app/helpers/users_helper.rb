module UsersHelper

  def authorize
    redirect_to '/login' unless current_user
  end

end

