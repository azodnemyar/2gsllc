class UsersController < ApplicationController
  before_action :signed_in_user
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,      only: [:index,  :destroy, :new, :create]
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def index
    @users = User.all
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update    
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Added New User Successfully!"
      redirect_to users_path
    else
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end
  
  def delete
    User.where(id: params[:user_ids]).delete_all
    flash[:success] = "User successfully deleted."
    redirect_to users_path
  end
  
  private
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) || current_user.admin?
    end
    
    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation, :admin, attachment_attributes: [:id, :file])
    end  
  
end
