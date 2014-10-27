class UsersController < ApplicationController
  before_action :authenticate,            except: [:new, :create]
  before_action :load_user,               except: [:index, :new, :create]
  before_action :authorize_admin_only,    only:   :index
  before_action :authorize_user_only,     only:   :show
  before_action :authorize_user_or_admin, except: [:index, :show, :new, :create]



  def index
    authorize_admin_only
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = User.find_by(name: user_params["name"])
    # id = @user.id
    # redirect_to "/users/#{id}"
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render(:edit)
    end
  end

  # GET /users/1/password
  def password
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.save
    render :new
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
        redirect_to user_path(@user)
    else
        render(:edit)
    end
  end

    # PATCH/PUT /users/1/password
  def update_password
    if !@user.authenticate(user_password_params[:old_password])
      @user.errors.add(:old_password, 'must match the current password')
      render(:password)
    elsif user_password_params[:password].blank?
      @user.errors.add(:new_password, 'can\'t be blank!')
      render(:password)
    elsif @user.update(user_password_params.except(:old_password))
      flash[:notice] = "Your password has been updated!"
      redirect_to user_path(@user)
    else
      render(:password)
    end
  end

 # DELETE /users/1
  def destroy
    if current_user == @user
      @user.destroy
      log_out!
      flash[:notice] = "Thanks for the memories..."
      redirect_to(root_path)
    else # admin is deleting...
      @user.destroy
      redirect_to(users_path)
    end
  end

  def confirm_delete
  end


  private

  def user_params
    params.require(:user).permit(
      :email,
      :name,
      :password,
      :password_confirmation
    )
  end

  def user_password_params
    @user_password_params ||= params.require(:user).permit(
      :old_password,
      :password,
      :password_confirmation
    )
  end

  def load_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path if !@user
  end

  def authorize_admin_only
    unless current_user.is_admin?
      redirect_to user_path(current_user)
    end
  end

  def authorize_user_only
    unless current_user == @user
      redirect_to user_path(current_user)
    end
  end

  def authorize_user_or_admin
    unless current_user == @user || current_user.is_admin?
      redirect_to user_path(current_user)
    end
  end
end
