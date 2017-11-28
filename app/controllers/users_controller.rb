class UsersController < ApplicationController
  
  def index
    @users = User.all.order("updated_at DESC")

    user = User.find_by(id: params[:internship_placement])

    if params[:internship_placement] && user
      user.internship_placement = true
      
      if user.save
        InternshipUpdate.create(user_id: user.id, starting_at: user.updated_at)
        redirect_to users_path
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end
  
end
