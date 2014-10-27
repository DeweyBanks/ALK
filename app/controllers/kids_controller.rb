class KidsController < ApplicationController

  def index
  end

  def new
    @kid = Kid.new
  end

  # POST /kids
  # POST /kids.json
  def create
    @kid = Kid.new(kid_params)
    @kid.save
    render :show
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

end
