class UsersController < ApplicationController
  #before_filter :authenticate_user!, except: [:index]
  load_and_authorize_resource

  before_filter :load_roles, :only => [:new, :edit, :update, :create]

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

  private
  def load_roles
    @roles = Role.all
  end
  def find_resource
    @user ||= User.find params[:id]
  end
end
