class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def new

  end

  def show
    @user = User.find(params[:id])
  end

  def index
    @users= User.all
  end

  def edit

  end


end
