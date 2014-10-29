class KidsController < ApplicationController
  before_action :load_kid
  before_action :load_user
  before_action :set_user
  before_action :authorize_user_only,     only:   :show
  before_action :authorize_admin_only,    only:   :index
  before_action :authorize_user_or_admin, except: [:index, :show, :new, :create]


  def index
    authorize_admin_only
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

  def update
    if @kid.update(kid_params)
      redirect_to kid_path(@kid)
    else
      render(:edit)
    end
  end


  def show
    @kid = Kid.find(params[:id])
    @user = User.find_by(id: current_user)
  end

  def edit
    @kid = Kid.find(params[:id])
  end

   # DELETE /kids/1
  def destroy
    if current_kid == @kid
      @kid.destroy
      flash[:notice] = "Thanks for the memories..."
      redirect_to(users_path)
    else # admin is deleting...
      @kid.destroy
      redirect_to(users_path)
    end
  end

  def confirm_delete
  end


   private

  def kid_params
    params.require(:kid).permit(
      :user_id,
      :avatar,
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
      :behavior_consent,
      :image_consent,
      :late_consent,

    )
  end

    def current_kid
    end

    def load_kid
      @kid = Kid.find_by(id: params[:id])
    end

    def load_user
      @user = User.find_by(id: params[:id])
      # redirect_to root_path if !@user
    end

    def set_user
      @user = User.find(session[:user_id])
    end

    def authorize_admin_only
      unless current_user.is_admin?
        redirect_to user_path(current_user)
      end
    end

    def authorize_user_or_admin
      unless current_user == @user || current_user.is_admin?
        redirect_to user_path(current_user)
      end
    end

    def authorize_user_only
      unless current_user == @user
        redirect_to user_path(current_user)
      end
    end
end
