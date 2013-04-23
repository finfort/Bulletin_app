class AdvertisementsController < ApplicationController
  before_filter :authenticate_user!
  def create
    #File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
    #    file.write(uploaded_io.read)
    #end
    @advertisement = current_user.advertisements.build(params[:advertisement])
    #@advertisement.content=RedCloth.new(@advertisement.content).to_html
    if @advertisement.save
      flash.notice = "Advert created!"
      redirect_to root_url
    else
      render "static_pages/home"
    end

  end

  def edit
    @advertisement = Advertisement.find(params[:id])
  end

  def update
    @advertisement = Advertisement.find(params[:id])
    if @advertisement.update_attributes(params[:advertisement])
      flash.notice= "Advert updated!"
      redirect_to @advertisement.user
    else
      render "edit"
    end
  end


  def index
   @advertisement_items = Advertisement.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
   @user_who_commented = @current_user
   @comment = Comment.build_from( Advertisement.last, User.first, "Hey this is my comment!" )
  end

  def show
    @advertisement = Advertisement.find(params[:id])

  end

  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy
    flash.notice = "Successfully destroyed advert."
    #redirect_to :controller => "user", :action => "show"
    #redirect_to :controller => "user", :action => "show", :id => @advertisement.user.id
    redirect_to @advertisement.user
  end
end
