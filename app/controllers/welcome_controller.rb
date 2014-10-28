class WelcomeController < ApplicationController

  # def index
  #   if session[:user_id]
  #     user = User.find_by(id: session[:user_id])
  #     redirect_to(user_path(user))
  #   else
  #     redirect_to(login_path)
  #   end
  # end

  def index
    redirect_to(home_index_path)
  end

end
