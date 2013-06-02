class UsersController < ApplicationController
  load_and_authorize_resource

  before_filter :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 50)
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update_attributes params[:user]
      flash[:success] = "User saved."
      redirect_to users_path
    else
      flash[:error] = "Unable to save user."
      render :edit
    end
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

end
