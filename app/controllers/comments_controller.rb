class CommentsController < ApplicationController

  def index
    @commentable = Advertisement.find(params[:advertisement])
    @comments = @commentable.comments
  end


  def new
  end

end
