class UsersController < ApplicationController
  before_action :set_q_for_room, only: [:account, :profile]
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "プロフィール情報が更新されました"
      redirect_to users_profile_path
    else
      render "profile"
    end
  end
  
  def account
    @user = current_user
  end

  def profile
    @user = current_user
  end
  
  private
    def user_params
      params.require(:user).permit(:image, :name, :introduction)
    end
end
