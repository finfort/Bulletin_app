class UsersController < ApplicationController
  load_and_authorize_resource
  before_filter :authenticate_user!, :except => [:show, :index]
  #before_filter :load_roles, :only => [:new, :edit, :update, :create]

  def new

  end

  def show
    @user = User.find(params[:id])
    @advertisements = @user.advertisements.paginate(page: params[:page])
  end

  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def edit
    @user= User.find(params[:id])
  end

  def update
    @user= User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice]= "User updated"
      redirect_to @user
    else
      render @user
    end
  end

  def assign_moderator_role
    @user = User.find(params[:id])
    @user.add_role "moderator"
    redirect_to @user
  end

  def remove_moderator_role
    @user = User.find(params[:id])
    @user.remove_role "moderator"
    redirect_to @user
  end

  def assign_user_role
    @user = User.find(params[:id])
    @user.add_role "user"
    redirect_to @user
  end

  def remove_user_role
    @user = User.find(params[:id])
    @user.remove_role "user"
    redirect_to @user
  end

  private
  def load_roles
    @roles = Role.all
  end
  def find_resource
    @user ||= User.find params[:id]
  end
end
