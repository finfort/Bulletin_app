class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
  before_filter :authenticate_user!
#  before_filter :find_resource, :only => [:update,
#                                          :edit,
#                                          :show], :unless => :devise_controller?
end
