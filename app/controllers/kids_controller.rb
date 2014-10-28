class KidsController < ApplicationController
  before_action :load_user
  before_action :set_user
  before_action :authorize_admin_only,    only:   :index


  def index
    @kids = Kid.all
  end

  def new
    @user = User.find_by(id: current_user)
    @kid = Kid.new
  end

  # POST /kids
  # POST /kids.json
  def create
    @kid = Kid.new(kid_params)
    @kid.user_id = current_user.id
    respond_to do |format|
      if @kid.save
        format.html { render :show }
        format.json { render :show }
      else
        format.html { render :new }
        format.json { render :new }
      end
    end
  end

  def show
  end

  def edit
    @kid = Kid.find(params[:id])
  end


   private

  def kid_params
    params.require(:kid).permit(
      :name,
      :email,
      :grade,
      :classroom,
      :dob,
      :address,
      :apt,
      :city,
      :state,
      :zip,
      :home_phone,
      :work_phone,
      :parent,
      :pickup,
      :allergies,
      :user_id
    )
  end

    def load_user
      @user = User.find_by(id: params[:id])
      # redirect_to root_path if !@user
    end

    def set_user
      @user = User.find(session[:user_id])
    end

end
