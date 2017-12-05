class UsersController < ApplicationController
  before_action :set_user, :only => [:show, :edit, :update]
  
  def index
    @users = User.all.order("updated_at DESC")

    # user = User.find_by(id: params[:internship_placement])

    # if params[:internship_placement] && user
    #   user.internship_placement = true
      
    #   if user.save
    #     InternshipUpdate.create(user_id: user.id, starting_at: user.updated_at)
    #     redirect_to users_path
    #   end
    # end`  
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :id_number, :password, :password_confirmation, application_attributes: [:id, :is_female, :phone_number, :bank_id, :bank_number, :bank_name, :field_of_study_id, :district_id, :sector_id])
  end

  def set_user
    @user = User.find(params[:id])
  end
end
