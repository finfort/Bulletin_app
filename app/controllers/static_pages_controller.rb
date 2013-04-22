class StaticPagesController < ApplicationController
  def home
    @advertisement_items = Advertisement.order('created_at DESC').limit(7)#.paginate(page: params[:page])
    if signed_in?
      @advertisement = current_user.advertisements.build
    end
  end
end
