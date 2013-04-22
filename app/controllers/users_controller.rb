class UsersController < ApplicationController
  before_filter :authenticate_user!, except: [:index]
  def new

  end

  def show
    @user = User.find(params[:id])
    @advertisements = @user.advertisements.paginate(page: params[:page])
  end

  def index
    #@users= User.all#.paginate(page: params[:page])
    @users = User.paginate(page: params[:page], :per_page => 10)
  end

  def edit

  end


end
