class AdvertisementsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :find_advertisement, :only => [:show, :edit, :update, :destroy]
  #########
  #CanCan
  #########

  load_and_authorize_resource
  ########
  #end CanCan
  ########
  def create
    @advertisement = current_user.advertisements.build(params[:advertisement])
    if @advertisement.save
      flash.notice = "Advert created!"
      redirect_to root_url
    else
      render "static_pages/home"
    end

  end

  def edit
  end

  def update
    if @advertisement.update_attributes(params[:advertisement])
      flash.notice= "Advert updated!"
      redirect_to @advertisement.user
    else
      render "edit"
    end
  end


  def index
   @advertisement_items = Advertisement.text_search(params[:query]).order('created_at DESC').paginate(page: params[:page], :per_page => 10)
  end

  def show
    @comment= Comment.new(:advertisement => @advertisement)
  end

  def destroy
    @advertisement.destroy
    flash.notice = "Successfully destroyed advert."
    redirect_to @advertisement.user
  end

  protected
  def find_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

end
