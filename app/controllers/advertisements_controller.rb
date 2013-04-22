class AdvertisementsController < ApplicationController
  before_filter :authenticate_user!
  def create
    #File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
    #    file.write(uploaded_io.read)
    #end
    @advertisement = current_user.advertisements.build(params[:advertisement])
    if @advertisement.save
      flash[:success] = "Advert created!"
      redirect_to root_url
    else
      render "static_pages/home"
    end

  end

  def edit
  end

  def index
   @advertisement_items = Advertisement.order('created_at DESC').paginate(page: params[:page], :per_page => 10)
   send_file "#{Rails.root}/imagenes_expedientes/#{@volunteer.avatar_url}",:disposition => 'inline', :type=>"application/jpg", :x_sendfile=>true
  end

  def show
  end

  def destroy
  end
end
